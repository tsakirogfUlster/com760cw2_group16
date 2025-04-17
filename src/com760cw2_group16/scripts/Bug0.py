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
    global state_, state_desc_, srv_client_wall_follower_, srv_client_go_to_point_
    if state != state_:
        rospy.loginfo("State changed: %s", state_desc_[state])
        state_ = state
        if state_ == 0:
            srv_client_go_to_point_(True)
            srv_client_wall_follower_(False)
        elif state_ == 1:
            srv_client_go_to_point_(False)
            srv_client_wall_follower_(True)

def handle_homing_signal(req):
    global desired_position_, initial_position_, position_

    desired_position_.x = req.x
    desired_position_.y = req.y
    desired_position_.z = 0

    initial_position_.x = position_.x
    initial_position_.y = position_.y
    initial_position_.z = 0

    resp1 = srv_client_go_to_point_(True)
    resp2 = srv_client_wall_follower_(False)
    rospy.wait_for_service('/set_target_point')
    set_target_srv = rospy.ServiceProxy('/set_target_point', SetTargetPoint)
    resp = set_target_srv(req.x, req.y)
    change_state(0)
    rospy.loginfo("Homing to target: (%.2f, %.2f)", req.x, req.y)
    return HomingSignalResponse(success=True, message="Homing target set")

def main():
    global regions_, position_, desired_position_, state_, yaw_, yaw_error_allowed_
    global srv_client_go_to_point_, srv_client_wall_follower_

    rospy.init_node('bug0')

    rospy.Subscriber('/group16Bot/laser/scan', LaserScan, clbk_laser)
    rospy.Subscriber('/group16Bot/odom', Odometry, clbk_odom)

    rospy.wait_for_service('/go_to_point_switch')
    rospy.wait_for_service('/wall_follower_switch')
    rospy.wait_for_service('/gazebo/set_model_state')

    srv_client_go_to_point_ = rospy.ServiceProxy('/go_to_point_switch', SetBool)
    srv_client_wall_follower_ = rospy.ServiceProxy('/wall_follower_switch', SetBool)
    srv_client_set_model_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)

    rospy.sleep(2.0)
    model_state = ModelState()
    model_state.model_name = 'group16Bot'
    model_state.pose.position.x = initial_position_.x
    model_state.pose.position.y = initial_position_.y
    srv_client_set_model_state(model_state)
    rospy.Service('/homing_signal', HomingSignal, handle_homing_signal)

    change_state(0)

    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        if regions_ is None:
            rate.sleep()
            continue

        if state_ == 0:
            if 0.15 < regions_['front'] < 1:
                change_state(1)

        rate.sleep()

if __name__ == "__main__":
    main()
