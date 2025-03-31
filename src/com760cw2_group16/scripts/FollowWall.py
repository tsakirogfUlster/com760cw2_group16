#!/usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

class FollowWall:
    def __init__(self):
        rospy.init_node('follow_wall')
        self.sub_laser = rospy.Subscriber('/group16Bot/laser/scan', LaserScan, self.laser_callback)
        self.pub = rospy.Publisher('/group16Bot/cmd_vel', Twist, queue_size=1)
        self.regions = {'front': float('inf'), 'left': float('inf'), 'right': float('inf')}
        self.rate = rospy.Rate(10)

    def laser_callback(self, msg):
        self.regions = {
            'front': min(min(msg.ranges[0:10] + msg.ranges[-10:]), 10),
            'left': min(min(msg.ranges[60:100]), 10),
            'right': min(min(msg.ranges[260:300]), 10),
        }

    def run(self):
        vel_msg = Twist()
        while not rospy.is_shutdown():
            if self.regions['front'] < 1.0:
                vel_msg.linear.x = 0.0
                vel_msg.angular.z = 0.5
            else:
                vel_msg.linear.x = 0.2
                vel_msg.angular.z = 0.0

            self.pub.publish(vel_msg)
            self.rate.sleep()

if __name__ == '__main__':
    FollowWall().run()
