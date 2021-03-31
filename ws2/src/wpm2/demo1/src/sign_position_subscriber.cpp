/**
 * 该例程将订阅/sign_position_info话题，自定义消息类型demo1::sign_position
 */
 
#include <ros/ros.h>
#include "demo1/sign_position.h"


// 接收到订阅的消息后，会进入消息回调函数
// void personInfoCallback(const learning_topic_pkg::Person::ConstPtr& msg)
void personInfoCallback(const demo1::sign_position::ConstPtr& msg)
{
    // 将接收到的消息打印出来
    ROS_INFO("Subcribe sign_position Info: x:%f  y:%f  z:%f", 
			 msg->x, msg->y, msg->z);
}

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "sign_position_subscriber");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
    ros::Subscriber person_info_sub = n.subscribe("/sign_position_info", 10, personInfoCallback);

    // 循环等待回调函数
    ros::spin();

    return 0;
}
