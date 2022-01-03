#!/usr/bin/env python3



import rospy
from std_msgs.msg import Int32

rospy.init_node('randomout')
pub = rospy.Publisher('randomget', Int32, queue_size=1)
rate = rospy.Rate(10)

import random

n=0
while not rospy.is_shutdown():
    n = random.randint(0, 5)
    pub.publish(n)
    rate.sleep()
