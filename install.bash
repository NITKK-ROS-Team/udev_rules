#!/bin/bash
if [ "$EUID" -ne 0 ]
   then echo "Please run as root"
   exit
fi

declare -a StringArray=("100-m5devices.rules" "101-webcams.rules")

for val in ${StringArray[@]}; do
   curl https://raw.githubusercontent.com/NITKK-ROS-Team/udev_rules/main/${val} --output /etc/udev/rules.d/${val}
done

udevadm control --reload-rules
udevadm trigger
