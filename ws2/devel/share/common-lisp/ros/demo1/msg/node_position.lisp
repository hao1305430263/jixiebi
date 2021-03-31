; Auto-generated. Do not edit!


(cl:in-package demo1-msg)


;//! \htmlinclude node_position.msg.html

(cl:defclass <node_position> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (theta_x
    :reader theta_x
    :initarg :theta_x
    :type cl:float
    :initform 0.0)
   (theta_y
    :reader theta_y
    :initarg :theta_y
    :type cl:float
    :initform 0.0)
   (theta_z
    :reader theta_z
    :initarg :theta_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass node_position (<node_position>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_position>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_position)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo1-msg:<node_position> is deprecated: use demo1-msg:node_position instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:x-val is deprecated.  Use demo1-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:y-val is deprecated.  Use demo1-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:z-val is deprecated.  Use demo1-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'theta_x-val :lambda-list '(m))
(cl:defmethod theta_x-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:theta_x-val is deprecated.  Use demo1-msg:theta_x instead.")
  (theta_x m))

(cl:ensure-generic-function 'theta_y-val :lambda-list '(m))
(cl:defmethod theta_y-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:theta_y-val is deprecated.  Use demo1-msg:theta_y instead.")
  (theta_y m))

(cl:ensure-generic-function 'theta_z-val :lambda-list '(m))
(cl:defmethod theta_z-val ((m <node_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo1-msg:theta_z-val is deprecated.  Use demo1-msg:theta_z instead.")
  (theta_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_position>) ostream)
  "Serializes a message object of type '<node_position>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_position>) istream)
  "Deserializes a message object of type '<node_position>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_position>)))
  "Returns string type for a message object of type '<node_position>"
  "demo1/node_position")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_position)))
  "Returns string type for a message object of type 'node_position"
  "demo1/node_position")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_position>)))
  "Returns md5sum for a message object of type '<node_position>"
  "b01742cd81703ae7d171d91df9eaf69e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_position)))
  "Returns md5sum for a message object of type 'node_position"
  "b01742cd81703ae7d171d91df9eaf69e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_position>)))
  "Returns full string definition for message of type '<node_position>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%float32 theta_x~%float32 theta_y~%float32 theta_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_position)))
  "Returns full string definition for message of type 'node_position"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%float32 theta_x~%float32 theta_y~%float32 theta_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_position>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_position>))
  "Converts a ROS message object to a list"
  (cl:list 'node_position
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':theta_x (theta_x msg))
    (cl:cons ':theta_y (theta_y msg))
    (cl:cons ':theta_z (theta_z msg))
))
