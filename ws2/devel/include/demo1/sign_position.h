// Generated by gencpp from file demo1/sign_position.msg
// DO NOT EDIT!


#ifndef DEMO1_MESSAGE_SIGN_POSITION_H
#define DEMO1_MESSAGE_SIGN_POSITION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace demo1
{
template <class ContainerAllocator>
struct sign_position_
{
  typedef sign_position_<ContainerAllocator> Type;

  sign_position_()
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  sign_position_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::demo1::sign_position_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::demo1::sign_position_<ContainerAllocator> const> ConstPtr;

}; // struct sign_position_

typedef ::demo1::sign_position_<std::allocator<void> > sign_position;

typedef boost::shared_ptr< ::demo1::sign_position > sign_positionPtr;
typedef boost::shared_ptr< ::demo1::sign_position const> sign_positionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::demo1::sign_position_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::demo1::sign_position_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::demo1::sign_position_<ContainerAllocator1> & lhs, const ::demo1::sign_position_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::demo1::sign_position_<ContainerAllocator1> & lhs, const ::demo1::sign_position_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace demo1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::demo1::sign_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::demo1::sign_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::demo1::sign_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::demo1::sign_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::demo1::sign_position_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::demo1::sign_position_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::demo1::sign_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cc153912f1453b708d221682bc23d9ac";
  }

  static const char* value(const ::demo1::sign_position_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcc153912f1453b70ULL;
  static const uint64_t static_value2 = 0x8d221682bc23d9acULL;
};

template<class ContainerAllocator>
struct DataType< ::demo1::sign_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "demo1/sign_position";
  }

  static const char* value(const ::demo1::sign_position_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::demo1::sign_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n"
"float32 y\n"
"float32 z\n"
;
  }

  static const char* value(const ::demo1::sign_position_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::demo1::sign_position_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct sign_position_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::demo1::sign_position_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::demo1::sign_position_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEMO1_MESSAGE_SIGN_POSITION_H
