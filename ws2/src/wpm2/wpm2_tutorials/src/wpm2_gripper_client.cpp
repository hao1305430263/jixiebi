/*********************************************************************
* Software License Agreement (BSD License)
* 
*  Copyright (c) 2017-2020, Waterplus http://www.6-robot.com
*  All rights reserved.
* 
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
* 
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the WaterPlus nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
* 
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  FOOTPRINTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/
/*!******************************************************************
 @author     ZhangWanjie
 ********************************************************************/

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <control_msgs/GripperCommandAction.h>

int main (int argc, char **argv)
{
  ros::init(argc, argv, "wpm2_gripper_client");

  actionlib::SimpleActionClient<control_msgs::GripperCommandAction> acGripper("wpm2_gripper_controller/gripper_command", true);

  // ??????WPM2?????????????????????
  ROS_INFO("Waiting for gripper server to start.");
  acGripper.waitForServer();

  // ?????????????????????,??????????????????
  ROS_INFO("Action server started, sending command.");
  control_msgs::GripperCommandGoal gripperCmd;
  // ????????????,????????????(??????0.05??????????????????????????????????????????5??????)
  gripperCmd.command.position = 0.05;
  acGripper.sendGoal(gripperCmd);

  // ????????????????????????,????????????10???(?????????10.0)?????????????????????
  bool finished_before_timeout = acGripper.waitForResult(ros::Duration(10.0));

  if (finished_before_timeout)
  {
    // ??????????????????,??????????????????
    actionlib::SimpleClientGoalState state = acGripper.getState();
    ROS_INFO("Action finished: %s",state.toString().c_str());
  }
  else
  {
    // ??????????????????
    ROS_INFO("Action did not finish before the time out.");
  }

  return 0;
}