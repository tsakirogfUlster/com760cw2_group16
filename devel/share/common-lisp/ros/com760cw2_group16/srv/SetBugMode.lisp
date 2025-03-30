; Auto-generated. Do not edit!


(cl:in-package com760cw2_group16-srv)


;//! \htmlinclude SetBugMode-request.msg.html

(cl:defclass <SetBugMode-request> (roslisp-msg-protocol:ros-message)
  ((go_to_point
    :reader go_to_point
    :initarg :go_to_point
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetBugMode-request (<SetBugMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetBugMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetBugMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<SetBugMode-request> is deprecated: use com760cw2_group16-srv:SetBugMode-request instead.")))

(cl:ensure-generic-function 'go_to_point-val :lambda-list '(m))
(cl:defmethod go_to_point-val ((m <SetBugMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:go_to_point-val is deprecated.  Use com760cw2_group16-srv:go_to_point instead.")
  (go_to_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetBugMode-request>) ostream)
  "Serializes a message object of type '<SetBugMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'go_to_point) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetBugMode-request>) istream)
  "Deserializes a message object of type '<SetBugMode-request>"
    (cl:setf (cl:slot-value msg 'go_to_point) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetBugMode-request>)))
  "Returns string type for a service object of type '<SetBugMode-request>"
  "com760cw2_group16/SetBugModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetBugMode-request)))
  "Returns string type for a service object of type 'SetBugMode-request"
  "com760cw2_group16/SetBugModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetBugMode-request>)))
  "Returns md5sum for a message object of type '<SetBugMode-request>"
  "825c9fba73fc02bf0bf49f8dcde95afa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetBugMode-request)))
  "Returns md5sum for a message object of type 'SetBugMode-request"
  "825c9fba73fc02bf0bf49f8dcde95afa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetBugMode-request>)))
  "Returns full string definition for message of type '<SetBugMode-request>"
  (cl:format cl:nil "bool go_to_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetBugMode-request)))
  "Returns full string definition for message of type 'SetBugMode-request"
  (cl:format cl:nil "bool go_to_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetBugMode-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetBugMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetBugMode-request
    (cl:cons ':go_to_point (go_to_point msg))
))
;//! \htmlinclude SetBugMode-response.msg.html

(cl:defclass <SetBugMode-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetBugMode-response (<SetBugMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetBugMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetBugMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name com760cw2_group16-srv:<SetBugMode-response> is deprecated: use com760cw2_group16-srv:SetBugMode-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetBugMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:success-val is deprecated.  Use com760cw2_group16-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetBugMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader com760cw2_group16-srv:message-val is deprecated.  Use com760cw2_group16-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetBugMode-response>) ostream)
  "Serializes a message object of type '<SetBugMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetBugMode-response>) istream)
  "Deserializes a message object of type '<SetBugMode-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetBugMode-response>)))
  "Returns string type for a service object of type '<SetBugMode-response>"
  "com760cw2_group16/SetBugModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetBugMode-response)))
  "Returns string type for a service object of type 'SetBugMode-response"
  "com760cw2_group16/SetBugModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetBugMode-response>)))
  "Returns md5sum for a message object of type '<SetBugMode-response>"
  "825c9fba73fc02bf0bf49f8dcde95afa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetBugMode-response)))
  "Returns md5sum for a message object of type 'SetBugMode-response"
  "825c9fba73fc02bf0bf49f8dcde95afa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetBugMode-response>)))
  "Returns full string definition for message of type '<SetBugMode-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetBugMode-response)))
  "Returns full string definition for message of type 'SetBugMode-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetBugMode-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetBugMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetBugMode-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetBugMode)))
  'SetBugMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetBugMode)))
  'SetBugMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetBugMode)))
  "Returns string type for a service object of type '<SetBugMode>"
  "com760cw2_group16/SetBugMode")