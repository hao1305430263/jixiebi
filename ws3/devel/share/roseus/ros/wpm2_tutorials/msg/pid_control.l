;; Auto-generated. Do not edit!


(when (boundp 'wpm2_tutorials::pid_control)
  (if (not (find-package "WPM2_TUTORIALS"))
    (make-package "WPM2_TUTORIALS"))
  (shadow 'pid_control (find-package "WPM2_TUTORIALS")))
(unless (find-package "WPM2_TUTORIALS::PID_CONTROL")
  (make-package "WPM2_TUTORIALS::PID_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude pid_control.msg.html


(defclass wpm2_tutorials::pid_control
  :super ros::object
  :slots (_speedH _speedW _degreeH _degreeW ))

(defmethod wpm2_tutorials::pid_control
  (:init
   (&key
    ((:speedH __speedH) 0.0)
    ((:speedW __speedW) 0.0)
    ((:degreeH __degreeH) 0.0)
    ((:degreeW __degreeW) 0.0)
    )
   (send-super :init)
   (setq _speedH (float __speedH))
   (setq _speedW (float __speedW))
   (setq _degreeH (float __degreeH))
   (setq _degreeW (float __degreeW))
   self)
  (:speedH
   (&optional __speedH)
   (if __speedH (setq _speedH __speedH)) _speedH)
  (:speedW
   (&optional __speedW)
   (if __speedW (setq _speedW __speedW)) _speedW)
  (:degreeH
   (&optional __degreeH)
   (if __degreeH (setq _degreeH __degreeH)) _degreeH)
  (:degreeW
   (&optional __degreeW)
   (if __degreeW (setq _degreeW __degreeW)) _degreeW)
  (:serialization-length
   ()
   (+
    ;; float32 _speedH
    4
    ;; float32 _speedW
    4
    ;; float32 _degreeH
    4
    ;; float32 _degreeW
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speedH
       (sys::poke _speedH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speedW
       (sys::poke _speedW (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _degreeH
       (sys::poke _degreeH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _degreeW
       (sys::poke _degreeW (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speedH
     (setq _speedH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speedW
     (setq _speedW (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _degreeH
     (setq _degreeH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _degreeW
     (setq _degreeW (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wpm2_tutorials::pid_control :md5sum-) "82d8395801dda259b07c2aa9213a389a")
(setf (get wpm2_tutorials::pid_control :datatype-) "wpm2_tutorials/pid_control")
(setf (get wpm2_tutorials::pid_control :definition-)
      "float32 speedH
float32 speedW
float32 degreeH
float32 degreeW

")



(provide :wpm2_tutorials/pid_control "82d8395801dda259b07c2aa9213a389a")


