#include <ros/ros.h>
#include <sensor_msgs/JointState.h>

int main(int argc, char** argv)
{
	ros::init(argc, argv, "wpm2_joint_control_degree");

	ros::NodeHandle n;
	ros::Publisher joint_ctrl_pub = n.advertise<sensor_msgs::JointState>("wpm2/joint_ctrl_degree", 30);

	//控制变量
	sensor_msgs::JointState ctrl_msg;
	ctrl_msg.name.resize(7);
	ctrl_msg.position.resize(7);
	ctrl_msg.velocity.resize(7);
	//关节角度
	ctrl_msg.position[0] = 0;
	ctrl_msg.position[1] = 0;
	ctrl_msg.position[2] = 0;
	ctrl_msg.position[3] = 0;
	ctrl_msg.position[4] = 0;
	ctrl_msg.position[5] = 0;
	ctrl_msg.position[6] = 35000; //手爪闭合
	//运动速度
	ctrl_msg.velocity[0] = 1000;
	ctrl_msg.velocity[1] = 1000;
	ctrl_msg.velocity[2] = 1000;
	ctrl_msg.velocity[3] = 1000;
	ctrl_msg.velocity[4] = 1000;
	ctrl_msg.velocity[5] = 1000;
	ctrl_msg.velocity[6] = 1000;

	int nCount = 0;
	ros::Rate r(10);

	while(ros::ok())
	{
		ROS_INFO("[wpm2_joint_ctrl_degree] nCount = %d");
		ctrl_msg.position[0] = 90;
		ctrl_msg.position[1] = 90;
		ctrl_msg.position[2] = 90;
		ctrl_msg.position[3] = 90;
		ctrl_msg.position[4] = 90;
		ctrl_msg.position[5] = 0;
		ctrl_msg.position[6] = 35000; //手爪闭合
		joint_ctrl_pub.publish(ctrl_msg);
		ros::spinOnce();
		r.sleep();
	}

	return 0;
}
