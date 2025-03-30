#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from std_srvs.srv import SetBool, SetBoolResponse

class Bug2:
    def __init__(self):
        rospy.init_node('bug2')
        self.pub = rospy.Publisher('/group16Bot/cmd_vel', Twist, queue_size=1)
        self.state = 0  # 0: go_to_point, 1: follow_wall

        rospy.Service('/set_bug_mode', SetBool, self.service_callback)
        self.rate = rospy.Rate(10)

    def service_callback(self, req):
        if req.data:
            self.state = 0
            rospy.loginfo("Switching to GoToPoint mode.")
        else:
            self.state = 1
            rospy.loginfo("Switching to FollowWall mode.")
        return SetBoolResponse(success=True, message="Mode switched")

    def run(self):
        rospy.loginfo("Bug2 behavior started")
        while not rospy.is_shutdown():
            vel_msg = Twist()
            if self.state == 0:
                vel_msg.linear.x = 0.2
                vel_msg.angular.z = 0.0
            elif self.state == 1:
                vel_msg.linear.x = 0.0
                vel_msg.angular.z = 0.5

            self.pub.publish(vel_msg)
            self.rate.sleep()

if __name__ == '__main__':
    Bug2().run()
