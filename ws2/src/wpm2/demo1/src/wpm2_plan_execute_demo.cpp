#include <tf/transform_broadcaster.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model_loader/robot_model_loader.h>

#include "demo1/node_position.h"

static tf::StampedTransform transform;


// static double msg_x;
// static double msg_y;
// static double msg_z;
// static double msg_theta_x;
// static double msg_theta_y;
// static double msg_theta_z;
static float msg_x;
static float msg_y;
static float msg_z;
static float msg_theta_x;
static float msg_theta_y;
static float msg_theta_z;
static bool sign;

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
	sign = true;
	// move();
}

int main(int argc, char **argv)
{
	sign = false;

	ros::init(argc, argv, "wpm2_plan_execute_demo");

	ros::NodeHandle node_handle;

	moveit::planning_interface::MoveGroupInterface group("arm");
	geometry_msgs::Pose target_pose;
	tf::Quaternion quat;

	group.setGoalPositionTolerance(0.001);
    group.setGoalOrientationTolerance(0.01);


	// 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
	ros::Subscriber person_info_sub = node_handle.subscribe("/node_position_info", 10, infoCallback);

	ros::Rate loop_rate(1);
	while(ros::ok())
	{
		if(sign)
		{
			quat.setRPY(msg_theta_x, msg_theta_y, msg_theta_z);
			transform.setRotation(quat);
			target_pose.orientation.x= transform.getRotation().getX();
			target_pose.orientation.y = transform.getRotation().getY();
			target_pose.orientation.z = transform.getRotation().getZ();
			target_pose.orientation.w = transform.getRotation().getW();
			target_pose.position.x = msg_x;
			target_pose.position.y = msg_y;
			target_pose.position.z = msg_z;
			group.setPoseTarget(target_pose);
			ROS_INFO("x:%f  y:%f  z:%f X:%f, Y:%f, Z:%f, W:%f",
					target_pose.position.x,target_pose.position.y,target_pose.position.z,target_pose.orientation.x,target_pose.orientation.y,target_pose.orientation.z,target_pose.orientation.w);

			ros::AsyncSpinner spinner(1);
			spinner.start();
			moveit::planning_interface::MoveGroupInterface::Plan my_plan;
			moveit::planning_interface::MoveItErrorCode success = group.plan(my_plan);
			if(success == moveit_msgs::MoveItErrorCodes::SUCCESS)
			{
				ROS_INFO("[wpm2_planning] 轨迹规划成功! 开始执行! \n");
				group.execute(my_plan);
			}
			else
			{
				ROS_INFO("[wpm2_planning] 轨迹规划失败,请检查规划目标的参数 \n");
			}
			spinner.stop();
			sign = false;
		}

		ros::spinOnce();
		loop_rate.sleep();
		ROS_INFO("NO Subcribe");
	}
	return 0;
}
