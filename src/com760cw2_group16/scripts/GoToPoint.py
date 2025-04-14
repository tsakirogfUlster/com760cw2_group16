#! /usr/bin/env python
import math

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist, Point
from nav_msgs.msg import Odometry
from std_srvs.srv import SetBool, SetBoolResponse
from tf import transformations


# A partially completed python class used to move a robot from any point to a desired point

# It is used to suport the robot to navigate within in an unknown enviornment using a bug algorithm
# Here is a scenario:
# The robot starts with randomly wandering around waiting for a homing signal. Once it receives a homing signal,
# which can be published/set up using a custom message/service for example,
# it should begin the journey back to the docking station whose coordinates are specified in the custom message/service

class GoToPoint:

    def __init__(self):
        self.active = True

        # robot state variables
        self.position = Point()
        self.yaw = 0
        # A state machine: 0 - Fix heading; 1 - Go Straight; 2 - Reach the desitination
        # More information can be found at https://www.theconstructsim.com/ros-projects-exploring-ros-using-2-wheeled-robot-part-1/
        self.state = 0
        # Destination, which should be initilised using a custom service/message for example
        self.desired_position = Point()
        self.desired_position.x = rospy.get_param('des_pos_x')
        self.desired_position.y = rospy.get_param('des_pos_y')
        self.desired_position.z = 0
        # Threshold parameters
        self.yaw_threshold = rospy.get_param('th_yaw')  # unit: degree
        self.yaw_threshold *= math.pi / 90  # convert to radian

        self.dist_threshold = rospy.get_param('th_dist')  # unit: meter
        # publishers
        self.pub_vel = rospy.Publisher('/group16Bot/cmd_vel', Twist, queue_size=1)
        self.sub_odom = rospy.Subscriber('/group16Bot/odom', Odometry, self.callback_odom)
        # Declaring a new service named wall_follower_switch using the defined custom service as required.
        # All requests are passed to wall_follower_switch function
        self.srv = rospy.Service('go_to_point_switch', SetBool, self.go_to_point_switch)

        rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            if not self.active:
                continue
            else:
                if self.state == 0:
                    self.fix_heading(self.desired_position)
                elif self.state == 1:
                    self.go_straight(self.desired_position)
                elif self.state == 2:
                    self.done()
                else:
                    rospy.logerr('Unknown state!')

            rate.sleep()

    def go_to_point_switch(self, req):
        self.active = req.data
        res = SetBoolResponse()
        res.success = True
        res.message = 'Done!'
        return res

    def callback_odom(self, msg):
        self.position = msg.pose.pose.position
        orientation_q = msg.pose.pose.orientation
        quaternion = (
            orientation_q.x,
            orientation_q.y,
            orientation_q.z,
            orientation_q.w)
        euler = transformations.euler_from_quaternion(quaternion)
        self.yaw = euler[2]

    def change_state(self, state):
        if state != self.state:
            rospy.loginfo('State changed to [%s]', state)
            self.state = state

    def normalize_angle(self, angle):
        if abs(angle) > math.pi:
            angle = angle - (2 * math.pi * angle) / abs(angle)
        return angle

    def fix_heading(self, des_pos):
        desired_yaw = math.atan2(des_pos.y - self.position.y, des_pos.x - self.position.x)
        err_yaw = self.normalize_angle(desired_yaw - self.yaw)

        rospy.loginfo(err_yaw)

        twist_msg = Twist()
        if abs(err_yaw) > self.yaw_threshold:
            twist_msg.angular.z = 0.7 if err_yaw > 0 else -0.7

        self.pub_vel.publish(twist_msg)

        if abs(err_yaw) <= self.yaw_threshold:
            rospy.loginfo('Yaw error: [%s]', err_yaw)
            self.change_state(1)

    def go_straight(self, des_pos):
        desired_yaw = math.atan2(des_pos.y - self.position.y, des_pos.x - self.position.x)
        err_yaw = self.normalize_angle(desired_yaw - self.yaw)
        err_pos = math.sqrt(pow(des_pos.y - self.position.y, 2) + pow(des_pos.x - self.position.x, 2))

        twist_msg = Twist()
        if err_pos > self.dist_threshold:
            twist_msg.linear.x = 0.6
            twist_msg.angular.z = 0.2 if err_yaw > 0 else -0.2
            self.pub_vel.publish(twist_msg)
        else:
            rospy.loginfo('Position error: [%s]', err_pos)
            self.change_state(2)

        if abs(err_yaw) > self.yaw_threshold:
            rospy.loginfo('Yaw error: [%s]', err_yaw)
            self.change_state(0)

    def done(self):
        twist_msg = Twist()
        twist_msg.linear.x = 0
        twist_msg.angular.z = 0
        self.pub_vel.publish(twist_msg)

# Please complete the rest of code.
# The overall logic that governs its behavious can be found at
# https://www.theconstructsim.com/ros-projects-exploring-ros-using-2-wheeled-robot-part-1/

if __name__ == '__main__':
    rospy.init_node('go_to_point')
    GoToPoint()
    rospy.spin()