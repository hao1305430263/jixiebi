; Auto-generated. Do not edit!


(cl:in-package wpm2_tutorials-msg)


;//! \htmlinclude pid_control.msg.html

(cl:defclass <pid_control> (roslisp-msg-protocol:ros-message)
  ((speedH
    :reader speedH
    :initarg :speedH
    :type cl:float
    :initform 0.0)
   (speedW
    :reader speedW
    :initarg :speedW
    :type cl:float
    :initform 0.0)
   (degreeH
    :reader degreeH
    :initarg :degreeH
    :type cl:float
    :initform 0.0)
   (degreeW
    :reader degreeW
    :initarg :degreeW
    :type cl:float
    :initform 0.0))
)

(cl:defclass pid_control (<pid_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pid_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pid_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wpm2_tutorials-msg:<pid_control> is deprecated: use wpm2_tutorials-msg:pid_control instead.")))

(cl:ensure-generic-function 'speedH-val :lambda-list '(m))
(cl:defmethod speedH-val ((m <pid_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:speedH-val is deprecated.  Use wpm2_tutorials-msg:speedH instead.")
  (speedH m))

(cl:ensure-generic-function 'speedW-val :lambda-list '(m))
(cl:defmethod speedW-val ((m <pid_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:speedW-val is deprecated.  Use wpm2_tutorials-msg:speedW instead.")
  (speedW m))

(cl:ensure-generic-function 'degreeH-val :lambda-list '(m))
(cl:defmethod degreeH-val ((m <pid_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:degreeH-val is deprecated.  Use wpm2_tutorials-msg:degreeH instead.")
  (degreeH m))

(cl:ensure-generic-function 'degreeW-val :lambda-list '(m))
(cl:defmethod degreeW-val ((m <pid_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:degreeW-val is deprecated.  Use wpm2_tutorials-msg:degreeW instead.")
  (degreeW m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pid_control>) ostream)
  "Serializes a message object of type '<pid_control>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speedH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speedW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'degreeH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'degreeW))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pid_control>) istream)
  "Deserializes a message object of type '<pid_control>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speedH) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speedW) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'degreeH) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'degreeW) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pid_control>)))
  "Returns string type for a message object of type '<pid_control>"
  "wpm2_tutorials/pid_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pid_control)))
  "Returns string type for a message object of type 'pid_control"
  "wpm2_tutorials/pid_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pid_control>)))
  "Returns md5sum for a message object of type '<pid_control>"
  "82d8395801dda259b07c2aa9213a389a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pid_control)))
  "Returns md5sum for a message object of type 'pid_control"
  "82d8395801dda259b07c2aa9213a389a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pid_control>)))
  "Returns full string definition for message of type '<pid_control>"
  (cl:format cl:nil "float32 speedH~%float32 speedW~%float32 degreeH~%float32 degreeW~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pid_control)))
  "Returns full string definition for message of type 'pid_control"
  (cl:format cl:nil "float32 speedH~%float32 speedW~%float32 degreeH~%float32 degreeW~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pid_control>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pid_control>))
  "Converts a ROS message object to a list"
  (cl:list 'pid_control
    (cl:cons ':speedH (speedH msg))
    (cl:cons ':speedW (speedW msg))
    (cl:cons ':degreeH (degreeH msg))
    (cl:cons ':degreeW (degreeW msg))
))
