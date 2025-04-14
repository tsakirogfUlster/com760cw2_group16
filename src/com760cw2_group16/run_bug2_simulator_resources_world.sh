#!/bin/bash

PACKAGE_PATH=$(rospack find com760cw2_group16)

echo "World file in place. Launching Gazebo simulation and Bug2 algorithm..."
roslaunch com760cw2_group16 bug2_in_resources_world.launch

