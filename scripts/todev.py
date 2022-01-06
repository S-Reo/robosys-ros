"""
copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved
"""
#!/usr/bin/env python3
import rospy
from std_msgs.msg import String #Int32


import subprocess
def cb(message):
    rospy.loginfo(message.data)
    num=str(message.data)  
    subprocess.run(['bash','random.bash',num])
    print(num)
rospy.init_node('todev')
sub = rospy.Subscriber('randomget',String,cb)
rospy.spin()
