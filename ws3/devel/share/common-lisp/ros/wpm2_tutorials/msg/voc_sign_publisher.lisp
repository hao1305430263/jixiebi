; Auto-generated. Do not edit!


(cl:in-package wpm2_tutorials-msg)


;//! \htmlinclude voc_sign_publisher.msg.html

(cl:defclass <voc_sign_publisher> (roslisp-msg-protocol:ros-message)
  ((h
    :reader h
    :initarg :h
    :type cl:float
    :initform 0.0)
   (w
    :reader w
    :initarg :w
    :type cl:float
    :initform 0.0)
   (h1
    :reader h1
    :initarg :h1
    :type cl:float
    :initform 0.0)
   (w1
    :reader w1
    :initarg :w1
    :type cl:float
    :initform 0.0))
)

(cl:defclass voc_sign_publisher (<voc_sign_publisher>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voc_sign_publisher>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voc_sign_publisher)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wpm2_tutorials-msg:<voc_sign_publisher> is deprecated: use wpm2_tutorials-msg:voc_sign_publisher instead.")))

(cl:ensure-generic-function 'h-val :lambda-list '(m))
(cl:defmethod h-val ((m <voc_sign_publisher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:h-val is deprecated.  Use wpm2_tutorials-msg:h instead.")
  (h m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <voc_sign_publisher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:w-val is deprecated.  Use wpm2_tutorials-msg:w instead.")
  (w m))

(cl:ensure-generic-function 'h1-val :lambda-list '(m))
(cl:defmethod h1-val ((m <voc_sign_publisher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:h1-val is deprecated.  Use wpm2_tutorials-msg:h1 instead.")
  (h1 m))

(cl:ensure-generic-function 'w1-val :lambda-list '(m))
(cl:defmethod w1-val ((m <voc_sign_publisher>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wpm2_tutorials-msg:w1-val is deprecated.  Use wpm2_tutorials-msg:w1 instead.")
  (w1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voc_sign_publisher>) ostream)
  "Serializes a message object of type '<voc_sign_publisher>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'h1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voc_sign_publisher>) istream)
  "Deserializes a message object of type '<voc_sign_publisher>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w1) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voc_sign_publisher>)))
  "Returns string type for a message object of type '<voc_sign_publisher>"
  "wpm2_tutorials/voc_sign_publisher")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voc_sign_publisher)))
  "Returns string type for a message object of type 'voc_sign_publisher"
  "wpm2_tutorials/voc_sign_publisher")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voc_sign_publisher>)))
  "Returns md5sum for a message object of type '<voc_sign_publisher>"
  "717d36fcdaa720d867ffb3c469d5529d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voc_sign_publisher)))
  "Returns md5sum for a message object of type 'voc_sign_publisher"
  "717d36fcdaa720d867ffb3c469d5529d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voc_sign_publisher>)))
  "Returns full string definition for message of type '<voc_sign_publisher>"
  (cl:format cl:nil "float32 h~%float32 w~%float32 h1~%float32 w1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voc_sign_publisher)))
  "Returns full string definition for message of type 'voc_sign_publisher"
  (cl:format cl:nil "float32 h~%float32 w~%float32 h1~%float32 w1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voc_sign_publisher>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voc_sign_publisher>))
  "Converts a ROS message object to a list"
  (cl:list 'voc_sign_publisher
    (cl:cons ':h (h msg))
    (cl:cons ':w (w msg))
    (cl:cons ':h1 (h1 msg))
    (cl:cons ':w1 (w1 msg))
))
