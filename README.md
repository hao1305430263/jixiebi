# jixiebi

## 
× 仿真环境实现机械手臂达到固定姿态。

## 

ws2 目录下 
```
catkin_make
```
之后source 一下环境

打开新的命令行窗口
```
roslaunch wpm2_moveit_config demo.launch
```
打开新的命令行窗口
```
rosrun demo1 scene_add_collision_obj_demo
```
打开新的命令行窗口
```
rosrun demo1 sign_position_subscriber_publisher
```
打开新的命令行窗口
```
rosrun demo1 wpm2_plan_execute_demo
```
