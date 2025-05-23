#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Point
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from tf import transformations
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState
from std_srvs.srv import SetBool
from com760cw2_group16.srv import HomingSignal, HomingSignalResponse, SetTargetPoint

import math

# Global variables
srv_client_go_to_point_ = None
srv_client_wall_follower_ = None
yaw_ = 0
yaw_error_allowed_ = 5 * (math.pi / 180)  # 5 degrees
position_ = Point()

initial_position_ = Point()
initial_position_.x = rospy.get_param('initial_x')
initial_position_.y = rospy.get_param('initial_y')
initial_position_.z = 0

desired_position_ = Point()
desired_position_.x = rospy.get_param('des_pos_x')
desired_position_.y = rospy.get_param('des_pos_y')
desired_position_.z = 0

regions_ = None
state_desc_ = ['Go to point', 'Wall following']
state_ = 0
count_state_time_ = 0
count_loop_ = 0

# Callbacks
def clbk_odom(msg):
    global position_, yaw_
    position_ = msg.pose.pose.position
    quaternion = (
        msg.pose.pose.orientation.x,
        msg.pose.pose.orientation.y,
        msg.pose.pose.orientation.z,
        msg.pose.pose.orientation.w)
    euler = transformations.euler_from_quaternion(quaternion)
    yaw_ = euler[2]

def clbk_laser(msg):
    global regions_
    regions_ = {
        'right':  min(min(msg.ranges[0:143]), 10),
        'fright': min(min(msg.ranges[144:287]), 10),
        'front':  min(min(msg.ranges[288:431]), 10),
        'fleft':  min(min(msg.ranges[432:575]), 10),
        'left':   min(min(msg.ranges[576:719]), 10),
    }

def change_state(state):
    global state_, state_desc_, srv_client_wall_follower_, srv_client_go_to_point_, count_state_time_
    if state != state_:
        rospy.loginfo("State changed: %s", state_desc_[state])
        count_state_time_ = 0
        state_ = state
        if state_ == 0:
            srv_client_go_to_point_(True)
            srv_client_wall_follower_(False)
        elif state_ == 1:
            srv_client_go_to_point_(False)
            srv_client_wall_follower_(True)

def distance_to_line(p0):
    global initial_position_, desired_position_
    p1 = initial_position_
    p2 = desired_position_
    up_eq = math.fabs((p2.y - p1.y) * p0.x - (p2.x - p1.x) * p0.y + (p2.x * p1.y) - (p2.y * p1.x))
    lo_eq = math.sqrt(pow(p2.y - p1.y, 2) + pow(p2.x - p1.x, 2))
    return up_eq / lo_eq

def normalize_angle(angle):
    if abs(angle) > math.pi:
        angle = angle - (2 * math.pi * angle) / abs(angle)
    return angle

def handle_homing_signal(req):
    global desired_position_, initial_position_, position_

    # Update desired goal from service request
    desired_position_.x = req.x
    desired_position_.y = req.y
    desired_position_.z = 0

    # Update initial position to current one, so the line resets
    initial_position_.x = position_.x
    initial_position_.y = position_.y
    initial_position_.z = 0

    # Force activation of GoToPoint and deactivation of WallFollowing
    resp1 = srv_client_go_to_point_(True)
    resp2 = srv_client_wall_follower_(False)
    rospy.loginfo("Activated GoToPoint: %s | Deactivated WallFollower: %s", resp1.success, resp2.success)

    rospy.wait_for_service('/set_target_point')
    set_target_srv = rospy.ServiceProxy('/set_target_point', SetTargetPoint)
    resp = set_target_srv(req.x, req.y)
    rospy.loginfo("Sent target to GoToPoint: %s", resp.message)
    # Switch state to GoToPoint (to start driving toward the new goal)
    change_state(0)

    rospy.loginfo("Homing to new target: (%.2f, %.2f)", req.x, req.y)
    return HomingSignalResponse(success=True, message="Homing target set")

def main():
    global regions_, position_, desired_position_, state_, yaw_, yaw_error_allowed_
    global srv_client_go_to_point_, srv_client_wall_follower_
    global count_state_time_, count_loop_

    rospy.loginfo("Initial: (%.2f, %.2f)", initial_position_.x, initial_position_.y)
    rospy.loginfo("Goal:    (%.2f, %.2f)", desired_position_.x, desired_position_.y)

    rospy.init_node('bug2')

    sub_laser = rospy.Subscriber('/group16Bot/laser/scan', LaserScan, clbk_laser)
    sub_odom = rospy.Subscriber('/group16Bot/odom', Odometry, clbk_odom)

    rospy.wait_for_service('/go_to_point_switch')
    rospy.wait_for_service('/wall_follower_switch')
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.Service('/homing_signal', HomingSignal, handle_homing_signal)

    srv_client_go_to_point_ = rospy.ServiceProxy('/go_to_point_switch', SetBool)
    srv_client_wall_follower_ = rospy.ServiceProxy('/wall_follower_switch', SetBool)
    srv_client_set_model_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)

    rospy.sleep(2.0)

    # set robot position in Gazebo
    model_state = ModelState()
    model_state.model_name = 'group16Bot'
    model_state.pose.position.x = initial_position_.x
    model_state.pose.position.y = initial_position_.y
    resp = srv_client_set_model_state(model_state)

    # start by going to the point
    change_state(0)

    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        if regions_ is None:
            rate.sleep()
            continue

        distance_position_to_line = distance_to_line(position_)

        if state_ == 0:
            if regions_['front'] > 0.15 and regions_['front'] < 1:
                change_state(1)

        elif state_ == 1:
            if count_state_time_ > 5 and distance_position_to_line < 0.1:
                change_state(0)

        count_loop_ += 1
        if count_loop_ == 20:
            count_state_time_ += 1
            count_loop_ = 0

        rospy.loginfo("Distance to line: %.2f | Position: (%.2f, %.2f)", distance_position_to_line, position_.x, position_.y)

        rate.sleep()

if __name__ == "__main__":
    main()
    rospy.spin()
