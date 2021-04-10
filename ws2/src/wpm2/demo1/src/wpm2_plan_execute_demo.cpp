#include <tf/transform_broadcaster.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>

#include "demo1/node_position.h"

static tf::StampedTransform transform;


static double msg_x;
static double msg_y;
static double msg_z;
static double msg_theta_x;
static double msg_theta_y;
static double msg_theta_z;

void move()
{

	ros::AsyncSpinner spinner(1);
	spinner.start();
	moveit::planning_interface::MoveGroupInterface group("arm");
	// 设置机械臂末端的目标位置
	geometry_msgs::Pose target_pose;
	// 机械臂末端朝向(这里设置为竖直向上,以免运动时误碰周围物体)
	tf::Quaternion quat;
	// 手爪初始姿态是竖直向上,函数三个参数分别为滚转,俯仰和偏转角,单位为弧度
	// 滚动：以x为轴
	// 俯仰：以y为轴
	// 偏转角：以z为轴
	quat.setRPY(msg_theta_x, msg_theta_y, msg_theta_z);
	// 将欧拉角旋转量转换成四元数表达
	transform.setRotation(quat);
	target_pose.orientation.x= transform.getRotation().getX();
	target_pose.orientation.y = transform.getRotation().getY();
	target_pose.orientation.z = transform.getRotation().getZ();
	target_pose.orientation.w = transform.getRotation().getW();

	// 机械臂末端的空间坐标,单位为米
	target_pose.position.x = msg_x;
	target_pose.position.y = msg_y;
	target_pose.position.z = msg_z;
	group.setPoseTarget(target_pose);

	// 进行运动规划，只是计算出轨迹，还不会控制机械臂实际运动
	moveit::planning_interface::MoveGroupInterface::Plan my_plan;
	moveit::planning_interface::MoveItErrorCode success = group.plan(my_plan);
	if(success == moveit_msgs::MoveItErrorCodes::SUCCESS)
	{
		printf("[wpm2_planning] 轨迹规划成功! 开始执行! \n");

		// 机械臂按照规划的轨迹运动
		group.execute(my_plan);
	}
	else
	{
		printf("[wpm2_planning] 轨迹规划失败,请检查规划目标的参数 \n");
	}
	spinner.stop();
}

void infoCallback(const demo1::node_position::ConstPtr& msg)
{

	ROS_INFO("Subcribe node_position Info: x:%f  y:%f  z:%fm theta_x:%f, theta_y:%f, theta_z:%f",
		msg->x, msg->y, msg->z, msg->theta_x, msg->theta_y, msg->theta_z);
	
	msg_x = msg->x;
	msg_y = msg->y;
	msg_z = msg->z;
	msg_theta_x = msg->theta_x;
	msg_theta_y = msg->theta_y;
	msg_theta_z = msg->theta_z;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "wpm2_plan_execute_demo");

	ros::NodeHandle node_handle;

	// 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
	ros::Subscriber person_info_sub = node_handle.subscribe("/node_position_info", 10, infoCallback);

	ros::Rate loop_rate(0.1);
	while(ros::ok())
	{
		ros::spinOnce();
		loop_rate.sleep();
		move();
	}
	return 0;
}
