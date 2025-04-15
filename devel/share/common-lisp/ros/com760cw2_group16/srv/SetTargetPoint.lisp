; Auto-generated. Do not edit!


(cl:in-package com760cw2_group16-srv)


;//! \htmlinclude SetTargetPoint-request.msg.html

(cl:defclass <SetTargetPoint-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetTargetPoint-request (<SetTargetPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTargetPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTargetPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<SetTargetPoint-request> is deprecated: use com760cw2_group16-srv:SetTargetPoint-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <SetTargetPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:x-val is deprecated.  Use com760cw2_group16-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <SetTargetPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:y-val is deprecated.  Use com760cw2_group16-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTargetPoint-request>) ostream)
  "Serializes a message object of type '<SetTargetPoint-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTargetPoint-request>) istream)
  "Deserializes a message object of type '<SetTargetPoint-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTargetPoint-request>)))
  "Returns string type for a service object of type '<SetTargetPoint-request>"
  "com760cw2_group16/SetTargetPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargetPoint-request)))
  "Returns string type for a service object of type 'SetTargetPoint-request"
  "com760cw2_group16/SetTargetPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTargetPoint-request>)))
  "Returns md5sum for a message object of type '<SetTargetPoint-request>"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTargetPoint-request)))
  "Returns md5sum for a message object of type 'SetTargetPoint-request"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTargetPoint-request>)))
  "Returns full string definition for message of type '<SetTargetPoint-request>"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTargetPoint-request)))
  "Returns full string definition for message of type 'SetTargetPoint-request"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTargetPoint-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTargetPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTargetPoint-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude SetTargetPoint-response.msg.html

(cl:defclass <SetTargetPoint-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetTargetPoint-response (<SetTargetPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTargetPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTargetPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<SetTargetPoint-response> is deprecated: use com760cw2_group16-srv:SetTargetPoint-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetTargetPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:success-val is deprecated.  Use com760cw2_group16-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetTargetPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:message-val is deprecated.  Use com760cw2_group16-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTargetPoint-response>) ostream)
  "Serializes a message object of type '<SetTargetPoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTargetPoint-response>) istream)
  "Deserializes a message object of type '<SetTargetPoint-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTargetPoint-response>)))
  "Returns string type for a service object of type '<SetTargetPoint-response>"
  "com760cw2_group16/SetTargetPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargetPoint-response)))
  "Returns string type for a service object of type 'SetTargetPoint-response"
  "com760cw2_group16/SetTargetPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTargetPoint-response>)))
  "Returns md5sum for a message object of type '<SetTargetPoint-response>"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTargetPoint-response)))
  "Returns md5sum for a message object of type 'SetTargetPoint-response"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTargetPoint-response>)))
  "Returns full string definition for message of type '<SetTargetPoint-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTargetPoint-response)))
  "Returns full string definition for message of type 'SetTargetPoint-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTargetPoint-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTargetPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTargetPoint-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetTargetPoint)))
  'SetTargetPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetTargetPoint)))
  'SetTargetPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTargetPoint)))
  "Returns string type for a service object of type '<SetTargetPoint>"
  "com760cw2_group16/SetTargetPoint")