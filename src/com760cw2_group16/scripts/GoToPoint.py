#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist, Point
from nav_msgs.msg import Odometry
from tf import transformations
import math

class GoToPoint:
    def __init__(self):
        rospy.init_node('go_to_point')

        self.pub = rospy.Publisher('/group16Bot/cmd_vel', Twist, queue_size=1)
        self.sub_odom = rospy.Subscriber('/odom', Odometry, self.odom_callback)

        self.pose = Point()
        self.yaw = 0
        self.desired_position = Point()
        self.desired_position.x = 2
        self.desired_position.y = 0
        self.state = 0  # 0: going to point

        self.rate = rospy.Rate(10)

    def odom_callback(self, msg):
        self.pose = msg.pose.pose.position
        orientation_q = msg.pose.pose.orientation
        (_, _, self.yaw) = transformations.euler_from_quaternion(
            [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w])

    def run(self):
        vel_msg = Twist()
        while not rospy.is_shutdown():
            err_pos = math.sqrt((self.desired_position.x - self.pose.x)**2 +
                                (self.desired_position.y - self.pose.y)**2)

            if err_pos > 0.1:
                vel_msg.linear.x = 0.2
                vel_msg.angular.z = 0.0
            else:
                vel_msg.linear.x = 0.0
                vel_msg.angular.z = 0.0

            self.pub.publish(vel_msg)
            self.rate.sleep()

if __name__ == '__main__':
    GoToPoint().run()
