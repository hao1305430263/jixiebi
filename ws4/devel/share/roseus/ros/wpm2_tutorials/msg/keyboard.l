;; Auto-generated. Do not edit!


(when (boundp 'wpm2_tutorials::keyboard)
  (if (not (find-package "WPM2_TUTORIALS"))
    (make-package "WPM2_TUTORIALS"))
  (shadow 'keyboard (find-package "WPM2_TUTORIALS")))
(unless (find-package "WPM2_TUTORIALS::KEYBOARD")
  (make-package "WPM2_TUTORIALS::KEYBOARD"))

(in-package "ROS")
;;//! \htmlinclude keyboard.msg.html


(defclass wpm2_tutorials::keyboard
  :super ros::object
  :slots (_input1 _input2 ))

(defmethod wpm2_tutorials::keyboard
  (:init
   (&key
    ((:input1 __input1) 0)
    ((:input2 __input2) 0)
    )
   (send-super :init)
   (setq _input1 (round __input1))
   (setq _input2 (round __input2))
   self)
  (:input1
   (&optional __input1)
   (if __input1 (setq _input1 __input1)) _input1)
  (:input2
   (&optional __input2)
   (if __input2 (setq _input2 __input2)) _input2)
  (:serialization-length
   ()
   (+
    ;; int32 _input1
    4
    ;; int32 _input2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _input1
       (write-long _input1 s)
     ;; int32 _input2
       (write-long _input2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _input1
     (setq _input1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _input2
     (setq _input2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wpm2_tutorials::keyboard :md5sum-) "edeabc49039f3caeacd6317ca5d6e180")
(setf (get wpm2_tutorials::keyboard :datatype-) "wpm2_tutorials/keyboard")
(setf (get wpm2_tutorials::keyboard :definition-)
      "int32 input1
int32 input2

")



(provide :wpm2_tutorials/keyboard "edeabc49039f3caeacd6317ca5d6e180")


