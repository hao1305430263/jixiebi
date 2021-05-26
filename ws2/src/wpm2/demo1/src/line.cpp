#include <ros/ros.h>
#include <iostream>
#include <visualization_msgs/Marker.h>
#include "demo1/sign_position.h"
#include <cmath>
#include<vector>
#include<iostream> 

using namespace std;
typedef vector<double> Vec;

void drawline(double line_x,double line_y,double line_z)
{
     ros::NodeHandle n;
      ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);
      visualization_msgs::Marker line_list,line_list2; 

      int id=2;
     	int *a;
       int *b;
       int *c;
       
       
       int d=1;



      ros::Rate r(10);     
        while (ros::ok())
  {
    line_list.header.frame_id = "base_link";
    line_list.header.stamp = ros::Time::now();
    line_list.ns = "lines";
    line_list.action = visualization_msgs::Marker::ADD;
    line_list.pose.orientation.w = 1.0;
    line_list.id = 1;
    line_list.type = visualization_msgs::Marker::LINE_LIST;
    // LINE_STRIP/LINE_LIST markers use only the x component of scale, for the line width
    line_list.scale.x = 0.002;
    // Line list is red
    line_list.color.r = 1.0;
    line_list.color.a = 1.0;
    // Create the vertices for the points and lines
    line_list.lifetime = ros::Duration();
    geometry_msgs::Point p;
    p.x = 0;
    p.y = 0;
    p.z = 0.6;

    line_list.points.push_back(p);
    p.x= line_x;
    p.y = line_y;  
    p.z = line_z;
    line_list.points.push_back(p);
    marker_pub.publish(line_list);

        //line_list2
  //   line_list2.header.frame_id = "base_link";
  //   line_list2.header.stamp = ros::Time::now();
  //   line_list2.ns = "lines";
  //   line_list2.action = visualization_msgs::Marker::ADD;
  //   line_list2.pose.orientation.w = 1.0;
  //   line_list2.id = id;
  //   line_list2.type = visualization_msgs::Marker::LINE_LIST;
  //   LINE_STRIP/LINE_LIST markers use only the x component of scale, for the line width
  //   line_list2.scale.x = 0.002;
  //   Line list is red
  //   line_list2.color.b = 1.0;
  //   line_list2.color.a = 1.0;
  //   Create the vertices for the points and lines
  //  line_list2.lifetime = 0;
  //    a= new int[d];  
  //    b= new int[d];  
  //    c= new int[d];  
  //  a[d]=line_x;
  //  b[d]=line_y;
  //  c[d]=line_z;

    

  //   geometry_msgs::Point p2;
  //   p2.x = a[d];
  //   p2.y =b[d];
  //   p2.z = c[d];

  //   line_list2.points.push_back(p2);
  //   if (d=0)
  //   {
  //   p2.x= a[0];
  //   p2.y =b[0];  
  //   p2.z = c[0];
  //   }
  //   else 
  //   {
  //   p2.x= a[d-1];
  //   p2.y =b[d-1];  
  //   p2.z = c[d-1];
  //   }
  //   line_list2.points.push_back(p2);
  //   marker_pub.publish(line_list2);
   
  	


     ros::spinOnce();
     bool met =r.sleep(); 
    // id+=1;
    // d+=1;
  }
}

	void positioncallback(const demo1::sign_position::ConstPtr& msg)
		{
      double line_x;
      double line_y;
      double line_z;
			line_x = msg->x;
			line_y = msg->y;
			line_z = msg->z;
      ROS_INFO("line_x:%f  line_y:%f  line_z:%f",
					 line_x, line_y, line_z);
      
      drawline(line_x,line_y,line_z);  
		}
		
int main( int argc, char** argv )
{
  ros::init(argc, argv, "showline");
  ros::NodeHandle n;
	ros::Subscriber sign_position_Subscriber  = n.subscribe("sign_position_info", 100,  positioncallback);
  ros::spin();
  return 0;
}
