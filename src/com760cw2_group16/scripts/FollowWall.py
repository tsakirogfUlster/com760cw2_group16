#! /usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from std_srvs.srv import SetBool, SetBoolResponse
from tf import transformations


# A partially completed python class used to make the robot follow a wall
# It is used to suport the robot to navigate within in an unknown enviornment using a bug algorithm
# Here is a scenario:
# The robot starts with randomly wandering around waiting for a homing signal. Once it receives a homing signal,
# which can be published/set up using a custom message/service for example,
# it should begin the journey back to the docking station whose coordinates are specified in the custom message/service

class FollowWall:

    def __init__(self):

        self.active = False

        # A state machine: 0 - Find the wall; 1 - Turn left/right; 2 - Follow the wall
        # More information can be found at https://www.theconstructsim.com/ros-projects-exploring-ros-using-2-wheeled-robot-part-1/

        self.state = 0
        self.regions = {
            'right': float('inf'),
            'fright': float('inf'),
            'front': float('inf'),
            'fleft': float('inf'),
            'left': float('inf')
        }

        self.pub_vel = rospy.Publisher('/group16Bot/cmd_vel', Twist, queue_size=1)
        self.sub_laser = rospy.Subscriber('/group16Bot/laser/scan', LaserScan, self.callback_laser)
        self.srv = rospy.Service('wall_follower_switch', SetBool, self.wall_follower_switch)

        rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            if not self.active:
                rate.sleep()
                continue

            msg = Twist()
            if self.state == 0:
                msg = self.find_wall()
            elif self.state == 1:
                # When the robot detects an obstacle it executes the turn action
                # The turning direction should be initially determined by using the custome service defined
                # The robot should be able to try different turning direction if it cannot find a path to the goal
                msg = self.turn()
            elif self.state == 2:
                rospy.loginfo("Following the wall...")
                msg = self.follow_the_wall()
                pass
            else:
                rospy.logerr('Unknown state!')

            self.pub_vel.publish(msg)

            rate.sleep()

    def wall_follower_switch(self, req):
        self.active = req.data
        res = SetBoolResponse()
        res.success = True
        res.message = 'Wall follower active: {}'.format(self.active)
        return res

    def callback_laser(self, msg):
        self.regions = {
            'right':  min(min(msg.ranges[0:143]), 10),
            'fright': min(min(msg.ranges[144:287]), 10),
            'front':  min(min(msg.ranges[288:431]), 10),
            'fleft':  min(min(msg.ranges[432:575]), 10),
            'left':   min(min(msg.ranges[576:719]), 10),
        }
        self.take_action()

    # Method to be used for changing direction
    def change_state(self, state):
        if state != self.state:
            rospy.loginfo('Wall follower - [%s]', state)
            self.state = state

    # Position analysis and decide directions
    def take_action(self):
        d = 1.5
        r = self.regions

        if r['front'] > d and r['fleft'] > d and r['fright'] > d:
            self.change_state(0)
        elif r['front'] < d and r['fleft'] > d and r['fright'] > d:
            self.change_state(1)
        elif r['front'] > d and r['fleft'] > d and r['fright'] < d:
            self.change_state(2)
        elif r['front'] > d and r['fleft'] < d and r['fright'] > d:
            self.change_state(0)
        elif r['front'] < d and r['fleft'] > d and r['fright'] < d:
            self.change_state(1)
        elif r['front'] < d and r['fleft'] < d and r['fright'] > d:
            self.change_state(1)
        elif r['front'] < d and r['fleft'] < d and r['fright'] < d:
            self.change_state(1)
        elif r['front'] > d and r['fleft'] < d and r['fright'] < d:
            self.change_state(0)
        else:
            rospy.loginfo('Unknown case: %s', r)

    def find_wall(self):
        msg = Twist()
        msg.linear.x = 0.2
        msg.angular.z = -0.3
        return msg

    def turn(self):
        msg = Twist()
        msg.angular.z = 0.3
        return msg

    def follow_the_wall(self):
        msg = Twist()
        msg.linear.x = 0.5
        return msg

# Please complete the rest of code.
# The overall logic that governs its behavious can be found at
# https://www.theconstructsim.com/ros-projects-exploring-ros-using-2-wheeled-robot-part-1/

if __name__ == '__main__':
    rospy.init_node('follow_wall')
    FollowWall()
    rospy.spin()