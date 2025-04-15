;; Auto-generated. Do not edit!


(when (boundp 'com760cw2_group16::SetTargetPoint)
  (if (not (find-package "COM760CW2_GROUP16"))
    (make-package "COM760CW2_GROUP16"))
  (shadow 'SetTargetPoint (find-package "COM760CW2_GROUP16")))
(unless (find-package "COM760CW2_GROUP16::SETTARGETPOINT")
  (make-package "COM760CW2_GROUP16::SETTARGETPOINT"))
(unless (find-package "COM760CW2_GROUP16::SETTARGETPOINTREQUEST")
  (make-package "COM760CW2_GROUP16::SETTARGETPOINTREQUEST"))
(unless (find-package "COM760CW2_GROUP16::SETTARGETPOINTRESPONSE")
  (make-package "COM760CW2_GROUP16::SETTARGETPOINTRESPONSE"))

(in-package "ROS")





(defclass com760cw2_group16::SetTargetPointRequest
  :super ros::object
  :slots (_x _y ))

(defmethod com760cw2_group16::SetTargetPointRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass com760cw2_group16::SetTargetPointResponse
  :super ros::object
  :slots (_success _message ))

(defmethod com760cw2_group16::SetTargetPointResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass com760cw2_group16::SetTargetPoint
  :super ros::object
  :slots ())

(setf (get com760cw2_group16::SetTargetPoint :md5sum-) "3374a123f3f3fd3591258738a2b4096b")
(setf (get com760cw2_group16::SetTargetPoint :datatype-) "com760cw2_group16/SetTargetPoint")
(setf (get com760cw2_group16::SetTargetPoint :request) com760cw2_group16::SetTargetPointRequest)
(setf (get com760cw2_group16::SetTargetPoint :response) com760cw2_group16::SetTargetPointResponse)

(defmethod com760cw2_group16::SetTargetPointRequest
  (:response () (instance com760cw2_group16::SetTargetPointResponse :init)))

(setf (get com760cw2_group16::SetTargetPointRequest :md5sum-) "3374a123f3f3fd3591258738a2b4096b")
(setf (get com760cw2_group16::SetTargetPointRequest :datatype-) "com760cw2_group16/SetTargetPointRequest")
(setf (get com760cw2_group16::SetTargetPointRequest :definition-)
      "float32 x
float32 y
---
bool success
string message
")

(setf (get com760cw2_group16::SetTargetPointResponse :md5sum-) "3374a123f3f3fd3591258738a2b4096b")
(setf (get com760cw2_group16::SetTargetPointResponse :datatype-) "com760cw2_group16/SetTargetPointResponse")
(setf (get com760cw2_group16::SetTargetPointResponse :definition-)
      "float32 x
float32 y
---
bool success
string message
")



(provide :com760cw2_group16/SetTargetPoint "3374a123f3f3fd3591258738a2b4096b")


