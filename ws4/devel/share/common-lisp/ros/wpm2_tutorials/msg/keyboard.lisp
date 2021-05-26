; Auto-generated. Do not edit!


(cl:in-package wpm2_tutorials-msg)


;//! \htmlinclude keyboard.msg.html

(cl:defclass <keyboard> (roslisp-msg-protocol:ros-message)
  ((input1
    :reader input1
    :initarg :input1
    :type cl:integer
    :initform 0)
   (input2
    :reader input2
    :initarg :input2
    :type cl:integer
    :initform 0))
)

(cl:defclass keyboard (<keyboard>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <keyboard>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'keyboard)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wpm2_tutorials-msg:<keyboard> is deprecated: use wpm2_tutorials-msg:keyboard instead.")))

(cl:ensure-generic-function 'input1-val :lambda-list '(m))
(cl:defmethod input1-val ((m <keyboard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:input1-val is deprecated.  Use wpm2_tutorials-msg:input1 instead.")
  (input1 m))

(cl:ensure-generic-function 'input2-val :lambda-list '(m))
(cl:defmethod input2-val ((m <keyboard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:input2-val is deprecated.  Use wpm2_tutorials-msg:input2 instead.")
  (input2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <keyboard>) ostream)
  "Serializes a message object of type '<keyboard>"
  (cl:let* ((signed (cl:slot-value msg 'input1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'input2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <keyboard>) istream)
  "Deserializes a message object of type '<keyboard>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<keyboard>)))
  "Returns string type for a message object of type '<keyboard>"
  "wpm2_tutorials/keyboard")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'keyboard)))
  "Returns string type for a message object of type 'keyboard"
  "wpm2_tutorials/keyboard")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<keyboard>)))
  "Returns md5sum for a message object of type '<keyboard>"
  "edeabc49039f3caeacd6317ca5d6e180")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'keyboard)))
  "Returns md5sum for a message object of type 'keyboard"
  "edeabc49039f3caeacd6317ca5d6e180")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<keyboard>)))
  "Returns full string definition for message of type '<keyboard>"
  (cl:format cl:nil "int32 input1~%int32 input2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'keyboard)))
  "Returns full string definition for message of type 'keyboard"
  (cl:format cl:nil "int32 input1~%int32 input2~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <keyboard>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <keyboard>))
  "Converts a ROS message object to a list"
  (cl:list 'keyboard
    (cl:cons ':input1 (input1 msg))
    (cl:cons ':input2 (input2 msg))
))
