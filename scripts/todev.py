#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

import subprocess
def cb(message):
    num=str(message)
    rospy.loginfo(message.data)
    subprocess.run(['bash','random.bash',num])
rospy.init_node('todev')
sub = rospy.Subscriber('randomget',Int32,cb)
rospy.spin()
