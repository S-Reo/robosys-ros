#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int32

rospy.init_node('randomout')
pub = rospy.Publisher('randomget', Int32, queue_size=1)
rate = rospy.Rate(10)

import random
import subprocess
from subprocess import PIPE

#type(number)
number = 0
while not rospy.is_shutdown():
    number = random.randint(0, 6) 
   # subprocess.run(['echo number > /dev/manyled0'],shell=True)
    #comp_process = 
    #print(comp_process.stdout)
    pub.publish(number)
    rate.sleep()
