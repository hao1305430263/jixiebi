#include <ros/ros.h>
#include <geometry_msgs/Pose.h>
#include <moveit_msgs/PlanningScene.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/GetStateValidity.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/ApplyPlanningScene.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_state/robot_state.h>
#include <moveit/robot_state/conversions.h>

#include <cstdlib>//使用随机函数
#include "demo1/sign_position.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "scene_add_collision_obj_demo");
  ros::AsyncSpinner spinner(1);
  spinner.start();

  ros::NodeHandle node_handle;
  ROS_INFO("this demo start");

   //设置随机种子  
  srand(time(0));
  
  // 用来发布目标物体位置变化的主题
  ros::Publisher sign_position_publisher = node_handle.advertise<demo1::sign_position>("sign_position_info", 1);
  

  // 用来发布场景变化信息的主题
  ros::Publisher planning_scene_diff_publisher = node_handle.advertise<moveit_msgs::PlanningScene>("planning_scene", 1);
  while (planning_scene_diff_publisher.getNumSubscribers() < 1)
  {
    ros::WallDuration sleep_t(0.5);
    sleep_t.sleep();
  }

  ros::Rate r(0.5);
  while(ros::ok())
  {
  // 障碍物参考坐标
  moveit_msgs::AttachedCollisionObject attached_object;
  attached_object.object.operation = attached_object.object.ADD;
  attached_object.object.id = "box";

  // 障碍物位置和姿态
  attached_object.link_name = "base_link";
  attached_object.object.header.frame_id = "base_link";
  geometry_msgs::Pose pose;
  pose.orientation.w = 1.0;
  // pose.position.x = 0.0;
  // pose.position.y = 1.2;
  // pose.position.z = 1.0;

  pose.position.x = 2 * double(rand())/double(RAND_MAX) - 1 + 0.3;
  pose.position.y = 2 * double(rand())/double(RAND_MAX) - 1 + 0.3;
  pose.position.z = 2 * double(rand())/double(RAND_MAX) + 0.3;


  // 障碍物类型和尺寸
  shape_msgs::SolidPrimitive primitive;
  // primitive.type = primitive.BOX;
  primitive.type = primitive.BOX;
  primitive.dimensions.resize(3);
  primitive.dimensions[0] = 0.1;
  primitive.dimensions[1] = 0.1;
  primitive.dimensions[2] = 0.1;

  attached_object.object.primitives.push_back(primitive);
  attached_object.object.primitive_poses.push_back(pose);

  moveit_msgs::PlanningScene planning_scene;
  planning_scene.world.collision_objects.push_back(attached_object.object);
  planning_scene.is_diff = true;
  planning_scene_diff_publisher.publish(planning_scene);

  demo1::sign_position sign_position_msg;
  sign_position_msg.x =  pose.position.x;
  sign_position_msg.y =  pose.position.y;
  sign_position_msg.z =  pose.position.z;

  sign_position_publisher.publish(sign_position_msg);

  ROS_INFO("x:%f, y:%f, z:%f", pose.position.x,pose.position.y ,pose.position.z);

  // ros::shutdown();
  // return 0;
  bool met = r.sleep();

  }
}
