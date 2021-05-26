;; Auto-generated. Do not edit!


(when (boundp 'wpm2_tutorials::voc_sign_publisher)
  (if (not (find-package "WPM2_TUTORIALS"))
    (make-package "WPM2_TUTORIALS"))
  (shadow 'voc_sign_publisher (find-package "WPM2_TUTORIALS")))
(unless (find-package "WPM2_TUTORIALS::VOC_SIGN_PUBLISHER")
  (make-package "WPM2_TUTORIALS::VOC_SIGN_PUBLISHER"))

(in-package "ROS")
;;//! \htmlinclude voc_sign_publisher.msg.html


(defclass wpm2_tutorials::voc_sign_publisher
  :super ros::object
  :slots (_h _w _h1 _w1 _sign ))

(defmethod wpm2_tutorials::voc_sign_publisher
  (:init
   (&key
    ((:h __h) 0.0)
    ((:w __w) 0.0)
    ((:h1 __h1) 0.0)
    ((:w1 __w1) 0.0)
    ((:sign __sign) 0)
    )
   (send-super :init)
   (setq _h (float __h))
   (setq _w (float __w))
   (setq _h1 (float __h1))
   (setq _w1 (float __w1))
   (setq _sign (round __sign))
   self)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:h1
   (&optional __h1)
   (if __h1 (setq _h1 __h1)) _h1)
  (:w1
   (&optional __w1)
   (if __w1 (setq _w1 __w1)) _w1)
  (:sign
   (&optional __sign)
   (if __sign (setq _sign __sign)) _sign)
  (:serialization-length
   ()
   (+
    ;; float32 _h
    4
    ;; float32 _w
    4
    ;; float32 _h1
    4
    ;; float32 _w1
    4
    ;; int32 _sign
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _h
       (sys::poke _h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _h1
       (sys::poke _h1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w1
       (sys::poke _w1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _sign
       (write-long _sign s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _h
     (setq _h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _h1
     (setq _h1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w1
     (setq _w1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _sign
     (setq _sign (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wpm2_tutorials::voc_sign_publisher :md5sum-) "124c383f53dd0a8e55cd05d9f136c3e3")
(setf (get wpm2_tutorials::voc_sign_publisher :datatype-) "wpm2_tutorials/voc_sign_publisher")
(setf (get wpm2_tutorials::voc_sign_publisher :definition-)
      "float32 h
float32 w
float32 h1
float32 w1
int32 sign

")



(provide :wpm2_tutorials/voc_sign_publisher "124c383f53dd0a8e55cd05d9f136c3e3")


