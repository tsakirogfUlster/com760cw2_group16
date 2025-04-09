#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist, Point
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
from tf import transformations
import math

class Bug2Full:
    def __init__(self):
        rospy.init_node('bug2_full')

        # Read start and goal from parameter server
        start = rospy.get_param('/start_point', [0.0, 0.0])
        goal = rospy.get_param('/goal_point', [2.0, 0.0])

        self.pose = Point()
        self.pose.x = start[0]
        self.pose.y = start[1]

        self.goal = Point()
        self.goal.x = goal[0]
        self.goal.y = goal[1]

        # Init rest
        self.yaw = 0
        self.regions = None
        self.state = 0  # 0: go to point, 1: follow wall, 2: goal reached

        # ROS interfaces
        self.pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
        rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        rospy.Subscriber('/odom', Odometry, self.odom_callback)

        self.rate = rospy.Rate(10)

    def laser_callback(self, msg):
        self.regions = {
            'front': min(min(msg.ranges[0:10] + msg.ranges[-10:]), 10),
            'left': min(min(msg.ranges[60:100]), 10),
            'right': min(min(msg.ranges[260:300]), 10),
        }

    def odom_callback(self, msg):
        self.pose = msg.pose.pose.position
        orientation_q = msg.pose.pose.orientation
        (_, _, self.yaw) = transformations.euler_from_quaternion(
            [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w])

    def distance_to_goal(self):
        return math.sqrt(
            (self.goal.x - self.pose.x) ** 2 + (self.goal.y - self.pose.y) ** 2
        )

    def run(self):
        rospy.loginfo("🚀 Bug2 behavior started")
        vel = Twist()

        while not rospy.is_shutdown():
            # Wait until we have data
            if self.regions is None:
                rospy.loginfo_throttle(2, "⏳ Waiting for laser scan data...")
                self.rate.sleep()
                continue

            dist = self.distance_to_goal()
            rospy.loginfo_throttle(1, f"📍 Pose: ({self.pose.x:.2f}, {self.pose.y:.2f}) | 📌 Goal: ({self.goal.x:.2f}, {self.goal.y:.2f}) | 📏 Distance: {dist:.2f} | 🧠 State: {self.state}")

            if dist < 0.2:
                self.state = 2

            if self.state == 0:  # Go to point
                if self.regions['front'] < 0.8:
                    self.state = 1
                    rospy.loginfo("🚧 Obstacle ahead → switching to FollowWall")
                    continue
                vel.linear.x = 0.3
                vel.angular.z = 0.0

            elif self.state == 1:  # Follow wall
                if self.regions['front'] > 1.0 and self.regions['left'] > 1.0:
                    self.state = 0
                    rospy.loginfo("🛣️ Path clear → switching to GoToPoint")
                    continue
                vel.linear.x = 0.1
                vel.angular.z = 0.4

            elif self.state == 2:  # Goal reached
                vel.linear.x = 0
                vel.angular.z = 0
                rospy.loginfo("🎯 Goal reached! Shutting down.")
                self.pub.publish(vel)
                break

            self.pub.publish(vel)
            self.rate.sleep()

if __name__ == '__main__':
    try:
        Bug2Full().run()
    except rospy.ROSInterruptException:
        pass
