;; Auto-generated. Do not edit!


(when (boundp 'demo1::node_position)
  (if (not (find-package "DEMO1"))
    (make-package "DEMO1"))
  (shadow 'node_position (find-package "DEMO1")))
(unless (find-package "DEMO1::NODE_POSITION")
  (make-package "DEMO1::NODE_POSITION"))

(in-package "ROS")
;;//! \htmlinclude node_position.msg.html


(defclass demo1::node_position
  :super ros::object
  :slots (_x _y _z _theta_x _theta_y _theta_z ))

(defmethod demo1::node_position
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:theta_x __theta_x) 0.0)
    ((:theta_y __theta_y) 0.0)
    ((:theta_z __theta_z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _theta_x (float __theta_x))
   (setq _theta_y (float __theta_y))
   (setq _theta_z (float __theta_z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:theta_x
   (&optional __theta_x)
   (if __theta_x (setq _theta_x __theta_x)) _theta_x)
  (:theta_y
   (&optional __theta_y)
   (if __theta_y (setq _theta_y __theta_y)) _theta_y)
  (:theta_z
   (&optional __theta_z)
   (if __theta_z (setq _theta_z __theta_z)) _theta_z)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _theta_x
    4
    ;; float32 _theta_y
    4
    ;; float32 _theta_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta_x
       (sys::poke _theta_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta_y
       (sys::poke _theta_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta_z
       (sys::poke _theta_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta_x
     (setq _theta_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta_y
     (setq _theta_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta_z
     (setq _theta_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get demo1::node_position :md5sum-) "b01742cd81703ae7d171d91df9eaf69e")
(setf (get demo1::node_position :datatype-) "demo1/node_position")
(setf (get demo1::node_position :definition-)
      "float32 x
float32 y
float32 z

float32 theta_x
float32 theta_y
float32 theta_z


")



(provide :demo1/node_position "b01742cd81703ae7d171d91df9eaf69e")


