// Generated by gencpp from file com760cw2_group16/SetBugMode.msg
// DO NOT EDIT!


#ifndef COM760CW2_GROUP16_MESSAGE_SETBUGMODE_H
#define COM760CW2_GROUP16_MESSAGE_SETBUGMODE_H

#include <ros/service_traits.h>


#include <com760cw2_group16/SetBugModeRequest.h>
#include <com760cw2_group16/SetBugModeResponse.h>


namespace com760cw2_group16
{

struct SetBugMode
{

typedef SetBugModeRequest Request;
typedef SetBugModeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetBugMode
} // namespace com760cw2_group16


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::com760cw2_group16::SetBugMode > {
  static const char* value()
  {
    return "825c9fba73fc02bf0bf49f8dcde95afa";
  }

  static const char* value(const ::com760cw2_group16::SetBugMode&) { return value(); }
};

template<>
struct DataType< ::com760cw2_group16::SetBugMode > {
  static const char* value()
  {
    return "com760cw2_group16/SetBugMode";
  }

  static const char* value(const ::com760cw2_group16::SetBugMode&) { return value(); }
};


// service_traits::MD5Sum< ::com760cw2_group16::SetBugModeRequest> should match 
// service_traits::MD5Sum< ::com760cw2_group16::SetBugMode > 
template<>
struct MD5Sum< ::com760cw2_group16::SetBugModeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::com760cw2_group16::SetBugMode >::value();
  }
  static const char* value(const ::com760cw2_group16::SetBugModeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::com760cw2_group16::SetBugModeRequest> should match 
// service_traits::DataType< ::com760cw2_group16::SetBugMode > 
template<>
struct DataType< ::com760cw2_group16::SetBugModeRequest>
{
  static const char* value()
  {
    return DataType< ::com760cw2_group16::SetBugMode >::value();
  }
  static const char* value(const ::com760cw2_group16::SetBugModeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::com760cw2_group16::SetBugModeResponse> should match 
// service_traits::MD5Sum< ::com760cw2_group16::SetBugMode > 
template<>
struct MD5Sum< ::com760cw2_group16::SetBugModeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::com760cw2_group16::SetBugMode >::value();
  }
  static const char* value(const ::com760cw2_group16::SetBugModeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::com760cw2_group16::SetBugModeResponse> should match 
// service_traits::DataType< ::com760cw2_group16::SetBugMode > 
template<>
struct DataType< ::com760cw2_group16::SetBugModeResponse>
{
  static const char* value()
  {
    return DataType< ::com760cw2_group16::SetBugMode >::value();
  }
  static const char* value(const ::com760cw2_group16::SetBugModeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COM760CW2_GROUP16_MESSAGE_SETBUGMODE_H
