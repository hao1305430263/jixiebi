#include<ros/ros.h>
#include<math.h>
#include<vector>
#include "demo1/sign_position.h"
#include "demo1/node_position.h"

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

		//向量内积
		double InnerProduct3D(const Vec& x, const Vec& y)
		{
			assert(x.size() == y.size());       // #include <cassert>
			double sum = 0.;
			for (size_t i = 0; i < x.size(); ++i)
				sum += x[i]*y[i];
			return sum;
		}

		//向量模长
		double norm(const Vec& x)
		{
			double val = 0.;
			for(auto elem: x)
				val += elem*elem;
			return sqrt(val);
			// #include <cmath>
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

			vector<double> v1;
			vector<double> vx;
			vector<double> vy;
			vector<double> vz;
			v1.push_back((sign_position_x - node_position_x)/(sign_position_z - node_position_z));
			v1.push_back((sign_position_y - node_position_y)/(sign_position_z - node_position_z));
			v1.push_back(1);

			// vc=[0,1,0]
			vx.push_back(0);
			vx.push_back(1);
			vx.push_back(0);

			// vy=[1,0,0]
			vy.push_back(1);
			vy.push_back(0);
			vy.push_back(0);

			// vz=[0,0,1]
			vz.push_back(0);
			vz.push_back(0);
			vz.push_back(1);


			double theta_x = 0.0;
			double theta_y = 0.0;
			double theta_z = 0.0;
			theta_x = asin(InnerProduct3D(v1,vy)/norm(v1));
			theta_y = asin(InnerProduct3D(v1,vz)/norm(v1));
			theta_z = 0.0;
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
	ros::init(argc, argv, "sign_position_subscriber_publisher");

	//Create an object of class SubscribeAndPublish that will take care of everything
	SubscribeAndPublish SAPObject;

	ros::spin();

	return 0;
}
