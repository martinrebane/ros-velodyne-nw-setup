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
2. It optionally assigns STATIC_IP to the selected interface
3. It routes requests to LIDAR_IP to network interface
4. It makes all of the above quick and easy, providing reasonable default values

## When do I need to set STATIC_IP to the network interface?

Your network interface (the port where you plug the cable in) needs to have an IP for velodyne drivers to work. If your LIDAR is connected directly to the ethernet port, then you most likely need to set static IP. On the other hand, if your computer is connected to the router and LIDAR is connected to the same router, the IP will probably be assigned by the router and you can skip this step. You can use `ifconfig` to see if the desired interface has IPv4 address assigned to it.
