#include <ros/ros.h>
#include "demo1/sign_position.h"
#include "demo1/node_position.h"

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
 

  // 根据sign_position 实现求解 node_position
  void callback(const demo1::sign_position::ConstPtr& msg)
  {
	ROS_INFO("Subcribe sign_position Info: x:%f  y:%f  z:%f",
			msg->x, msg->y, msg->z);
	sign_position_x = msg->x; 
	sign_position_y = msg->y; 
	sign_position_z = msg->z; 

	demo1::node_position node_position_msg;
	node_position_msg.x = 0;
	node_position_msg.y = 0;
	node_position_msg.z = 0;
	node_position_msg.theta_x = 0;
	node_position_msg.theta_y = 0;
	node_position_msg.theta_z = 0;
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
