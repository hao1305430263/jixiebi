#include <ros/ros.h>
#include <ros/console.h>
#include <nav_msgs/Path.h>
#include <std_msgs/String.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/transform_broadcaster.h>
#include <tf/tf.h>
#include "demo1/sign_position.h"

void drawpath(double path_x,double path_y,double path_z)
{
    ros::NodeHandle ph;
    ros::Publisher path_pub = ph.advertise<nav_msgs::Path>("trajectory",1, true);

     ros::Time current_time, last_time;
    current_time = ros::Time::now();
    last_time = ros::Time::now();

    nav_msgs::Path path;
    //nav_msgs::Path path;
    path.header.stamp=current_time;
    path.header.frame_id="base_link";


    ros::Rate loop_rate(10);
    while (ros::ok())
    {

        current_time = ros::Time::now();
        //compute odometry in a typical way given the velocities of the robot




        geometry_msgs::PoseStamped this_pose_stamped;
        this_pose_stamped.pose.position.x = path_x;
        this_pose_stamped.pose.position.y = path_y;
        this_pose_stamped.pose.position.z = path_z;

        this_pose_stamped.pose.orientation.x =0;
        this_pose_stamped.pose.orientation.y =0;
        this_pose_stamped.pose.orientation.z = 0;
        this_pose_stamped.pose.orientation.w = 1;

        this_pose_stamped.header.stamp=current_time;
        this_pose_stamped.header.frame_id="base_link";
        path.poses.push_back(this_pose_stamped);

        path_pub.publish(path);
        ros::spinOnce();               // check for incoming messages

        last_time = current_time;
        loop_rate.sleep();

    }
  }



	void pathcallback(const demo1::sign_position::ConstPtr& msg)
		{
            double path_x;
            double path_y;
            double path_z;
			path_x = msg->x;
			path_y = msg->y;
			path_z = msg->z;
      ROS_INFO("line_x:%f  line_y:%f  line_z:%f", path_x, path_y, path_z);
      
      drawpath(path_x,path_y,path_z);  
		}


int main (int argc, char **argv)
{
    ros::init (argc, argv, "showpath");
    ros::NodeHandle ph;
    //ros::Publisher path_pub = ph.advertise<nav_msgs::Path>("trajectory",1, true);
    ros::Subscriber sign_position_Subscriber  = ph.subscribe("sign_position_info", 100,  pathcallback);
    ros::spin();
    return 0;
}

