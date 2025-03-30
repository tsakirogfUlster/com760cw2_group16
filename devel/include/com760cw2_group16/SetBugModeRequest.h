// Generated by gencpp from file com760cw2_group16/SetBugModeRequest.msg
// DO NOT EDIT!


#ifndef COM760CW2_GROUP16_MESSAGE_SETBUGMODEREQUEST_H
#define COM760CW2_GROUP16_MESSAGE_SETBUGMODEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace com760cw2_group16
{
template <class ContainerAllocator>
struct SetBugModeRequest_
{
  typedef SetBugModeRequest_<ContainerAllocator> Type;

  SetBugModeRequest_()
    : go_to_point(false)  {
    }
  SetBugModeRequest_(const ContainerAllocator& _alloc)
    : go_to_point(false)  {
  (void)_alloc;
    }



   typedef uint8_t _go_to_point_type;
  _go_to_point_type go_to_point;





  typedef boost::shared_ptr< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetBugModeRequest_

typedef ::com760cw2_group16::SetBugModeRequest_<std::allocator<void> > SetBugModeRequest;

typedef boost::shared_ptr< ::com760cw2_group16::SetBugModeRequest > SetBugModeRequestPtr;
typedef boost::shared_ptr< ::com760cw2_group16::SetBugModeRequest const> SetBugModeRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace com760cw2_group16

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ad6d7cc73815c351452929e8e7a91f52";
  }

  static const char* value(const ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xad6d7cc73815c351ULL;
  static const uint64_t static_value2 = 0x452929e8e7a91f52ULL;
};

template<class ContainerAllocator>
struct DataType< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "com760cw2_group16/SetBugModeRequest";
  }

  static const char* value(const ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool go_to_point\n\
";
  }

  static const char* value(const ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.go_to_point);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetBugModeRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::com760cw2_group16::SetBugModeRequest_<ContainerAllocator>& v)
  {
    s << indent << "go_to_point: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.go_to_point);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COM760CW2_GROUP16_MESSAGE_SETBUGMODEREQUEST_H
