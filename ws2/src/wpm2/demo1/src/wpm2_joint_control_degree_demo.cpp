#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include "demo1/node_position.h"


static float msg_x;
static float msg_y;
static float msg_z;
static float msg_theta_x;
static float msg_theta_y;
static float msg_theta_z;

class SubscribeAndPublish
{
	public:
		SubscribeAndPublish()
		{
			joint_ctrl_pub = n.advertise<sensor_msgs::JointState>("joint_ctrl_degree", 30);
			person_info_sub = n.subscribe("/node_position_info", 30, &SubscribeAndPublish::callback,this);
		}

		void callback(const demo1::node_position::ConstPtr& msg)
		{
			ROS_INFO("Subcribe node_position Info: x:%f  y:%f  z:%fm theta_x:%f, theta_y:%f, theta_z:%f",
					msg->x, msg->y, msg->z, msg->theta_x, msg->theta_y, msg->theta_z);

			msg_x = msg->x;
			msg_y = msg->y;
			msg_z = msg->z;
			msg_theta_x = msg->theta_x;
			msg_theta_y = msg->theta_y;
			msg_theta_z = msg->theta_z;

			sensor_msgs::JointState ctrl_msg;
			ctrl_msg.name.resize(7);
			ctrl_msg.position.resize(7);
			ctrl_msg.velocity.resize(7);
			//关节角度
			ctrl_msg.position[0] = msg_theta_x * 180 / 3.14;
			ctrl_msg.position[1] = msg_theta_x * 180 / 3.14;
			ctrl_msg.position[2] = msg_theta_x * 180 / 3.14;
			ctrl_msg.position[3] = msg_theta_y * 3.14 / 180;
			ctrl_msg.position[4] = msg_theta_y * 3.14 / 180;
			ctrl_msg.position[5] = msg_theta_y * 3.14 / 180;
			ctrl_msg.position[6] = 35000; //手爪闭合
			//运动速度
			ctrl_msg.velocity[0] = 1000;
			ctrl_msg.velocity[1] = 1000;
			ctrl_msg.velocity[2] = 1000;
			ctrl_msg.velocity[3] = 1000;
			ctrl_msg.velocity[4] = 1000;
			ctrl_msg.velocity[5] = 1000;
			ctrl_msg.velocity[6] = 1000;
			joint_ctrl_pub.publish(ctrl_msg);
		}

	private:
		ros::NodeHandle n;
		ros::Publisher joint_ctrl_pub;
		ros::Subscriber person_info_sub;

};
//End of class SubscribeAndPublish




int main(int argc, char** argv)
{
	ros::init(argc, argv, "wpm2_joint_control_degree_demo");

	SubscribeAndPublish SAPObject;
	ros::spin();
	// ros::Rate loop_rate(0.2);  //频率0.2Hz,5秒一个周期
	// while(ros::ok())
	// {
	//     ros::spinOnce();
	//     loop_rate.sleep();
	// }
	return 0;
}
