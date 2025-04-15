;; Auto-generated. Do not edit!


(when (boundp 'com760cw2_group16::SetBugMode)
  (if (not (find-package "COM760CW2_GROUP16"))
    (make-package "COM760CW2_GROUP16"))
  (shadow 'SetBugMode (find-package "COM760CW2_GROUP16")))
(unless (find-package "COM760CW2_GROUP16::SETBUGMODE")
  (make-package "COM760CW2_GROUP16::SETBUGMODE"))
(unless (find-package "COM760CW2_GROUP16::SETBUGMODEREQUEST")
  (make-package "COM760CW2_GROUP16::SETBUGMODEREQUEST"))
(unless (find-package "COM760CW2_GROUP16::SETBUGMODERESPONSE")
  (make-package "COM760CW2_GROUP16::SETBUGMODERESPONSE"))

(in-package "ROS")





(defclass com760cw2_group16::SetBugModeRequest
  :super ros::object
  :slots (_go_to_point ))

(defmethod com760cw2_group16::SetBugModeRequest
  (:init
   (&key
    ((:go_to_point __go_to_point) nil)
    )
   (send-super :init)
   (setq _go_to_point __go_to_point)
   self)
  (:go_to_point
   (&optional __go_to_point)
   (if __go_to_point (setq _go_to_point __go_to_point)) _go_to_point)
  (:serialization-length
   ()
   (+
    ;; bool _go_to_point
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _go_to_point
       (if _go_to_point (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _go_to_point
     (setq _go_to_point (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass com760cw2_group16::SetBugModeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod com760cw2_group16::SetBugModeResponse
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

(defclass com760cw2_group16::SetBugMode
  :super ros::object
  :slots ())

(setf (get com760cw2_group16::SetBugMode :md5sum-) "825c9fba73fc02bf0bf49f8dcde95afa")
(setf (get com760cw2_group16::SetBugMode :datatype-) "com760cw2_group16/SetBugMode")
(setf (get com760cw2_group16::SetBugMode :request) com760cw2_group16::SetBugModeRequest)
(setf (get com760cw2_group16::SetBugMode :response) com760cw2_group16::SetBugModeResponse)

(defmethod com760cw2_group16::SetBugModeRequest
  (:response () (instance com760cw2_group16::SetBugModeResponse :init)))

(setf (get com760cw2_group16::SetBugModeRequest :md5sum-) "825c9fba73fc02bf0bf49f8dcde95afa")
(setf (get com760cw2_group16::SetBugModeRequest :datatype-) "com760cw2_group16/SetBugModeRequest")
(setf (get com760cw2_group16::SetBugModeRequest :definition-)
      "bool go_to_point
---
bool success
string message
")

(setf (get com760cw2_group16::SetBugModeResponse :md5sum-) "825c9fba73fc02bf0bf49f8dcde95afa")
(setf (get com760cw2_group16::SetBugModeResponse :datatype-) "com760cw2_group16/SetBugModeResponse")
(setf (get com760cw2_group16::SetBugModeResponse :definition-)
      "bool go_to_point
---
bool success
string message
")



(provide :com760cw2_group16/SetBugMode "825c9fba73fc02bf0bf49f8dcde95afa")


