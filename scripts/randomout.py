"""
copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved
"""
#!/usr/bin/env python3

import rospy
from std_msgs.msg import String # Int32

rospy.init_node('randomout')
pub = rospy.Publisher('randomget',String, queue_size=1)
rate = rospy.Rate(10)

import random
import subprocess
from subprocess import PIPE

#type(number)
number = 0
while not rospy.is_shutdown():
    number = str(random.randint(0, 9)) 
   # subprocess.run(['echo number > /dev/manyled0'],shell=True)
    #comp_process = 
    #print(comp_process.stdout)
    pub.publish(number)
    rate.sleep()
