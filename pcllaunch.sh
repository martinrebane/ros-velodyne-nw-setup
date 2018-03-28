#!/bin/bash

# This scipt will query for parameters, set up network interface
# and connect to Velodyne VLP-16 LIDAR, and
# will launch pointcloud capture 

STATIC_IP="192.168.1.100"
LIDAR_IP="192.168.1.201"

echo "Plug in ethernet cable for the LiDAR and switch off WIFI. Press any key when done."

read -s -n 1 key

echo "Lets assign a static IP for your ethernet adapter. Please select your network interface from the list"

ip -o link show | awk -F ': ' '{print $2 " - press " $1}'

read -s -n 1 key

INTERFACE=$(ip -o link show | awk "NR==$key" | awk -F ': ' '{print $2}')
echo "---------------------------------------------------"
echo "You selected $(tput setaf 2)$INTERFACE$(tput sgr0)"
echo "---------------------------------------------------"

echo "I am now going to set static IP to $(tput setaf 2)$STATIC_IP$(tput sgr 0) and LIDAR IP to $(tput setaf 2)$LIDAR_IP$(tput sgr 0)"
echo "If you do not like those values, $(tput setaf 1)press q to exit$(tput sgr 0) and edit those addresses in this file."
echo "Otherwise, please $(tput bold)press any other key to continue$(tput sgr 0) and you will be prompted for a $(tput bold)ROOT password$(tput sgr 0)"

read -s -n 1 key

if [[ $key =~ ^(q|Q)$ ]]; then 
	filename=$(basename $0)
	echo "Bye-bye, see you soon. You can edit this file using: nano $filename"
fi

$(sudo ifconfig $INTERFACE $STATIC_IP)

echo "Static IP of $INTERFACE set to $STATIC_IP"

IP_RESULT=$(ifconfig enp59s0 | grep -B1 $STATIC_IP | grep -o "^\w*")

if [[ $INTERFACE==$IP_RESULT ]]; then
	echo "$(tput setaf 2)SUCCESS!$(tput sgr 0)"
else 
	echo "$(tput setaf 1)FAILED!$(tput sgr 0)"
fi

$(sudo route add $LIDAR_IP $INTERFACE)

echo "LIDAR IP $LIDAR_IP routed to $INTERFACE"


echo "To start Velodyne capture, execute the following:"

	echo "--------------------------------------"
	echo "source ~/catkin_ws/devel/setup.bash"
	echo "roslaunch velodyne_pointcloud VLP16_points.launch calibration:=/opt/ros/kinetic/share/velodyne_pointcloud/params/VLP16db.yaml"
	echo "--------------------------------------"
	echo "# replace file paths where they are located in your system :)"

echo "DONE. Bye!"
