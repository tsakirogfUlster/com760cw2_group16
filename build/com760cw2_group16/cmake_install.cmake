# Install script for directory: /home/fotis/Documents/ulster/com760cw2_group16/src/com760cw2_group16

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/fotis/Documents/ulster/com760cw2_group16/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/srv" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/src/com760cw2_group16/srv/SetBugMode.srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/cmake" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/fotis/Documents/ulster/com760cw2_group16/devel/include/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/fotis/Documents/ulster/com760cw2_group16/devel/share/roseus/ros/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/fotis/Documents/ulster/com760cw2_group16/devel/share/common-lisp/ros/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/fotis/Documents/ulster/com760cw2_group16/devel/share/gennodejs/ros/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/fotis/Documents/ulster/com760cw2_group16/devel/lib/python2.7/dist-packages/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/fotis/Documents/ulster/com760cw2_group16/devel/lib/python2.7/dist-packages/com760cw2_group16")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/cmake" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/cmake" TYPE FILE FILES
    "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16Config.cmake"
    "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16Config-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/src/com760cw2_group16/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/cmake" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16/cmake" TYPE FILE FILES
    "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16Config.cmake"
    "/home/fotis/Documents/ulster/com760cw2_group16/build/com760cw2_group16/catkin_generated/installspace/com760cw2_group16Config-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/com760cw2_group16" TYPE FILE FILES "/home/fotis/Documents/ulster/com760cw2_group16/src/com760cw2_group16/package.xml")
endif()

