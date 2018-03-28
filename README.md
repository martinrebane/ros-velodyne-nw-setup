# Bash script to configure network to lauch Velodyne LIDAR for ROS point cloud capture

1. Setup your LIDAR and ROS as specified in http://wiki.ros.org/velodyne
2. Now each time you want to configure your network to use the LIDAR, just launch this script in the terminal

```bash
	./pcllaunch.sh
```

Make sure the path to the scipt is relative to in which folder you are currently.

Network is configured, now lauch pointcloud capture :)
