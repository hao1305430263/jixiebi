#!/usr/bin/python

import glob, torch
import numpy as np
from os.path import realpath, dirname, join

from net import SiamRPNvot
from run_SiamRPN import SiamRPN_init, SiamRPN_track
from utils import get_axis_aligned_bbox, cxy_wh_2_rect
import rospy
from sensor_msgs.msg import Image

from cv_bridge import CvBridge, CvBridgeError
import cv2
global img
# from std_msgs.msg import Float32MultiArray
from newmsg.msg import voc_sign_publisher

pub = rospy.Publisher('voc_sign_publisher', voc_sign_publisher, queue_size=10)
# load net
# 初始化网络模型
# cv2.namedWindow("im", cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO)
# cv.resizeWindow(display_name, 960, 720)
k = np.array([1436.46, 0, 991.946, 0, 1436.36, 544.537, 0, 0, 1]).reshape(3, 3)
invk = np.linalg.inv(k)


def act(img, state):
    toc = 0
    # 批量处理（伪视频流处理）

    # 读取图片
    im = img
    tic = cv2.getTickCount()
    # track
    state = SiamRPN_track(state, im)
    toc += cv2.getTickCount() - tic
    res = cxy_wh_2_rect(state['target_pos'], state['target_sz'])
    scores = state['score']
    res = [int(l) for l in res]
    # 跟踪框绘制
    cv2.rectangle(im, (res[0], res[1]), (res[0] + res[2], res[1] + res[3]),
                  (0, 255, 255), 3)
    # 显示跟踪结果
    # im = cv2.resize(im, (960, 480), interpolation=cv2.INTER_CUBIC)
    # out.write(im)
    boxlist = [res[0], res[1], res[2], res[3]]
    cv2.imshow('SiamRPN', im)
    hw = im.shape
    box_center_x_scale = (boxlist[0] + boxlist[2] / 2) / hw[1]
    box_center_y_scale = (boxlist[1] + boxlist[3] / 2) / hw[0]
    box_width_scale = (boxlist[2]) / hw[1]
    box_high_scale = (boxlist[3]) / hw[0]
    box = voc_sign_publisher()
    box.h = box_center_y_scale
    box.w = box_center_x_scale
    box.h1 = box_high_scale
    box.w1 = box_width_scale
    if scores < 0.5:
        info = [
            box_center_x_scale, box_center_y_scale, box_width_scale,
            box_high_scale, 0
        ]
        box.sign = 0
    else:
        info = [
            box_center_x_scale, box_center_y_scale, box_width_scale,
            box_high_scale, 1
        ]
        box.sign = 1

    pub.publish(box)
    print(scores)
    print(info)


def callback(data):
    # define picture to_down' coefficient of ratio
    scaling_factor = 0.5
    global count, bridge, state
    count = count + 1
    if (count == 1):
        cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
        img = cv_img
        cv2.imshow("im", img)
        x, y, w, h = cv2.selectROI("im", img, fromCenter=False)
        init_rbox = [x, y, x + w, y, x + w, y + h, x, y + h]
        [cx, cy, w, h] = get_axis_aligned_bbox(init_rbox)
        target_pos, target_sz = np.array([cx, cy]), np.array([w, h])
        state = SiamRPN_init(img, target_pos, target_sz, net)
        act(img, state)
        # cv2.setMouseCallback('im', on_mouse)
        cv2.waitKey(1)
    else:
        cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
        img = cv_img
        act(img, state)
        cv2.waitKey(1)


def displayWebcam():

    rospy.init_node('webcam_display', anonymous=True)

    # make a video_object and init the video object
    global count, bridge

    count = 0
    bridge = CvBridge()
    rospy.Subscriber('/zed/zed_node/rgb_raw/image_raw_color', Image, callback)
    rospy.spin()


net = SiamRPNvot()
# 网络模型参数读取
net.load_state_dict(
    torch.load(join(realpath(dirname(__file__)), 'SiamRPNVOT.model')))
# 将其放在GPU上运行
net.eval().cuda()

displayWebcam()
