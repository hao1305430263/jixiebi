#include<ros/ros.h>
#include<math.h>
#include<vector>
#include "demo1/sign_position.h"
#include "demo1/node_position.h"
#include <Eigen/Dense>
#define M_PI 3.14159265358

typedef Eigen::Vector3d Point;

using namespace std;
typedef vector<double> Vec;

class SubscribeAndPublish
{
	public:
		SubscribeAndPublish()
		{
			//Topic you want to publish
			node_position_publisher = n.advertise<demo1::node_position>("node_position_info", 1);

			//Topic you want to subscribe
			person_info_sub = n.subscribe("/sign_position_info", 10,
					&SubscribeAndPublish::callback,this);
		}



double getDegAngle(Point p1, Point p2, Point p3) {
    Eigen::Vector3d v1 = p2 - p1;
    Eigen::Vector3d v2 = p3 - p1;
    double radian_angle = atan2(v1.cross(v2).norm(), v1.transpose() * v2);
    if (v1.cross(v2).z() < 0) {
        radian_angle = 2 * M_PI - radian_angle;
    }
    return radian_angle ;
}


		// 根据sign_position 实现求解 node_position
		void callback(const demo1::sign_position::ConstPtr& msg)
		{
			double sign_position_x;
			double sign_position_y;
			double sign_position_z;
			double node_position_x;
			double node_position_y;
			double node_position_z;
			sign_position_x = msg->x;
			sign_position_y = msg->y;
			sign_position_z = msg->z;

			node_position_x = 0;
			node_position_y = 0;
			node_position_z = 0.6;

			Point p1(sign_position_x - node_position_x, sign_position_y - node_position_y, sign_position_z - node_position_z),
			 p0(0, 0, 0), p2(0, 0, 1),p3(sign_position_x - node_position_x, 0, sign_position_z - node_position_z);
			

			double theta_x = 0.0;
			double theta_y = 0.0;
			double theta_z = 0.0;

            if (sign_position_x > 0&&sign_position_y > 0)
			{
			    theta_x = -getDegAngle(p0, p3, p1);
			    theta_y = getDegAngle(p0, p3, p2);
			    theta_z = 0;
			}
           else if (sign_position_x > 0&&sign_position_y < 0)
			{
			    theta_x = getDegAngle(p0, p3, p1);
			    theta_y = getDegAngle(p0, p3, p2);
			    theta_z = 0;
			}
	      else if  (sign_position_x < 0&&sign_position_y >0)
        
			{
			    theta_x =-getDegAngle(p0, p3, p1);
			    theta_y = -getDegAngle(p0, p3, p2);
			    theta_z = 0;
			}
			//else if (sign_position_x < 0&&sign_position_y <0)
			else
			{
			    theta_x = getDegAngle(p0, p3, p1);
			    theta_y =- getDegAngle(p0, p3, p2);
			    theta_z = 0;
			}

			ROS_INFO("Subcribe sign_position Info: x:%f  y:%f  z:%f",
					sign_position_x, sign_position_y, sign_position_z);
			ROS_INFO("theta_x:%f  theta_y:%f  theta_z:%f",
					theta_x, theta_y, theta_z);

			demo1::node_position node_position_msg;
			node_position_msg.x = node_position_x;
			node_position_msg.y = node_position_y;
			node_position_msg.z = node_position_z;
			node_position_msg.theta_x = theta_x;
			node_position_msg.theta_y = theta_y;
			node_position_msg.theta_z = theta_z;
			node_position_publisher.publish(node_position_msg);
		}

	private:
		ros::NodeHandle n;
		ros::Publisher node_position_publisher;
		ros::Subscriber person_info_sub;

};
//End of class SubscribeAndPublish

int main(int argc, char **argv)
{
	//Initiate ROS
	ros::init(argc, argv, "subscribe_and_publish");

	//Create an object of class SubscribeAndPublish that will take care of everything
	SubscribeAndPublish SAPObject;

	ros::spin();

	return 0;
}
