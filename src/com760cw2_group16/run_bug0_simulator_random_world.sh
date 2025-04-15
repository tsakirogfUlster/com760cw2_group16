#!/bin/bash

PACKAGE_PATH=$(rospack find com760cw2_group16)

echo "Generating random Gazebo world..."
python $PACKAGE_PATH/world/generate_random_world.py

# Wait until a random_world.world is created
while [ ! -s $PACKAGE_PATH/world/random_world.world ]; do
  echo "Waiting for world file to be ready..."
  sleep 0.5
done

echo "World file ready. Launching Gazebo simulation and Bug2 algorithm..."
roslaunch com760cw2_group16 bug0_in_random_world.launch