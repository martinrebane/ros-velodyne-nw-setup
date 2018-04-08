# Bash script to configure network to lauch Velodyne LIDAR for ROS point cloud capture

1. Setup your LIDAR and ROS as specified in http://wiki.ros.org/velodyne
2. Make sure your desired IP and LIDAR IP are correct in the bash script, change if they are not (variables STATIC_IP and LIDAR_IP at the top)
3. Now each time you want to configure your network to use the LIDAR, just launch this script in the terminal

```bash
	./pcllaunch.sh
```

Make sure the path to the scipt is relative to the folder where you are currently working from.

Network is configured, now lauch pointcloud capture :)

## What does it do?

1. It lets you quickly select the network interface to use for LIDAR
2. It assigns STATIC_IP to the selected interface
3. It routes requests to LIDAR_IP to network interface
4. It makes all of the above quick and easy, providing reasonable default values
