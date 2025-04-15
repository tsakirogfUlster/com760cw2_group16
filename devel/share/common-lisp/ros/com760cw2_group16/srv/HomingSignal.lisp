; Auto-generated. Do not edit!


(cl:in-package com760cw2_group16-srv)


;//! \htmlinclude HomingSignal-request.msg.html

(cl:defclass <HomingSignal-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass HomingSignal-request (<HomingSignal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HomingSignal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HomingSignal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<HomingSignal-request> is deprecated: use com760cw2_group16-srv:HomingSignal-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <HomingSignal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:x-val is deprecated.  Use com760cw2_group16-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <HomingSignal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:y-val is deprecated.  Use com760cw2_group16-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HomingSignal-request>) ostream)
  "Serializes a message object of type '<HomingSignal-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HomingSignal-request>) istream)
  "Deserializes a message object of type '<HomingSignal-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HomingSignal-request>)))
  "Returns string type for a service object of type '<HomingSignal-request>"
  "com760cw2_group16/HomingSignalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HomingSignal-request)))
  "Returns string type for a service object of type 'HomingSignal-request"
  "com760cw2_group16/HomingSignalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HomingSignal-request>)))
  "Returns md5sum for a message object of type '<HomingSignal-request>"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HomingSignal-request)))
  "Returns md5sum for a message object of type 'HomingSignal-request"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HomingSignal-request>)))
  "Returns full string definition for message of type '<HomingSignal-request>"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HomingSignal-request)))
  "Returns full string definition for message of type 'HomingSignal-request"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HomingSignal-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HomingSignal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'HomingSignal-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude HomingSignal-response.msg.html

(cl:defclass <HomingSignal-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass HomingSignal-response (<HomingSignal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HomingSignal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HomingSignal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<HomingSignal-response> is deprecated: use com760cw2_group16-srv:HomingSignal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <HomingSignal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:success-val is deprecated.  Use com760cw2_group16-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <HomingSignal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:message-val is deprecated.  Use com760cw2_group16-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HomingSignal-response>) ostream)
  "Serializes a message object of type '<HomingSignal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HomingSignal-response>) istream)
  "Deserializes a message object of type '<HomingSignal-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HomingSignal-response>)))
  "Returns string type for a service object of type '<HomingSignal-response>"
  "com760cw2_group16/HomingSignalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HomingSignal-response)))
  "Returns string type for a service object of type 'HomingSignal-response"
  "com760cw2_group16/HomingSignalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HomingSignal-response>)))
  "Returns md5sum for a message object of type '<HomingSignal-response>"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HomingSignal-response)))
  "Returns md5sum for a message object of type 'HomingSignal-response"
  "3374a123f3f3fd3591258738a2b4096b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HomingSignal-response>)))
  "Returns full string definition for message of type '<HomingSignal-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HomingSignal-response)))
  "Returns full string definition for message of type 'HomingSignal-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HomingSignal-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HomingSignal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'HomingSignal-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'HomingSignal)))
  'HomingSignal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'HomingSignal)))
  'HomingSignal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HomingSignal)))
  "Returns string type for a service object of type '<HomingSignal>"
  "com760cw2_group16/HomingSignal")