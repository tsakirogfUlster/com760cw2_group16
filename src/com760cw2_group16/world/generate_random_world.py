import random

WORLD_SIZE = 10  # 10x10 meters
NUM_OBSTACLES = 6
NUM_RANDOM_WALLS = 3

def round_to_half(val):
    return round(val * 2) / 2.0

def write_header(f):
    f.write("""<?xml version="1.0"?>
<sdf version="1.6">
<world name="random_world">

  <include>
    <uri>model://ground_plane</uri>
  </include>

  <include>
    <uri>model://sun</uri>
  </include>
""")

def write_surrounding_wall(f):
    wall_thickness = 0.2
    wall_height = 1
    wall_length = WORLD_SIZE
    positions = [
        (0, wall_length/2, wall_height/2, wall_length, wall_thickness),
        (0, -wall_length/2, wall_height/2, wall_length, wall_thickness),
        (wall_length/2, 0, wall_height/2, wall_thickness, wall_length),
        (-wall_length/2, 0, wall_height/2, wall_thickness, wall_length)
    ]
    for i, (x, y, z, size_x, size_y) in enumerate(positions):
        f.write("""
  <model name="wall_{0}">
    <static>true</static>
    <link name="wall_link_{0}">
      <pose>{1} {2} {3} 0 0 0</pose>
      <collision name="collision">
        <geometry>
          <box><size>{4} {5} {6}</size></box>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <box><size>{4} {5} {6}</size></box>
        </geometry>
        <material><ambient>0.8 0.8 0.8 1</ambient></material>
      </visual>
    </link>
  </model>
""".format(i, x, y, z, size_x, size_y, wall_height))

def write_random_obstacles(f):
    for i in range(NUM_OBSTACLES):
        x = round_to_half(random.uniform(-WORLD_SIZE/2 + 1, WORLD_SIZE/2 - 1))
        y = round_to_half(random.uniform(-WORLD_SIZE/2 + 1, WORLD_SIZE/2 - 1))
        f.write("""
  <model name="obstacle_{0}">
    <static>true</static>
    <link name="obs_link_{0}">
      <pose>{1} {2} 0.25 0 0 0</pose>
      <collision name="collision">
        <geometry>
          <cylinder><radius>0.3</radius><length>0.5</length></cylinder>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <cylinder><radius>0.3</radius><length>0.5</length></cylinder>
        </geometry>
        <material><ambient>1 0 0 1</ambient></material>
      </visual>
    </link>
  </model>
""".format(i, x, y))

def write_random_walls(f):
    for i in range(NUM_RANDOM_WALLS):
        x = round_to_half(random.uniform(-WORLD_SIZE/2 + 2, WORLD_SIZE/2 - 2))
        y = round_to_half(random.uniform(-WORLD_SIZE/2 + 2, WORLD_SIZE/2 - 2))
        yaw = random.choice([0, 1.57])  # aligned
        length = random.choice([1.0, 2.0])
        f.write("""
  <model name="rand_wall_{0}">
    <static>true</static>
    <link name="rand_wall_link_{0}">
      <pose>{1} {2} 0.5 0 0 {3}</pose>
      <collision name="collision">
        <geometry>
          <box><size>{4} 0.2 1</size></box>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <box><size>{4} 0.2 1</size></box>
        </geometry>
        <material><ambient>0 1 0 1</ambient></material>
      </visual>
    </link>
  </model>
""".format(i, x, y, yaw, length))

def write_start_and_finish(f):
    f.write("""
  <model name="start_point">
    <static>true</static>
    <link name="start_link">
      <pose>-4 -4 0.01 0 0 0</pose>
      <visual name="visual">
        <geometry>
          <box><size>0.5 0.5 0.02</size></box>
        </geometry>
        <material><ambient>0 1 0 1</ambient></material>
      </visual>
    </link>
  </model>

  <model name="finish_point">
    <static>true</static>
    <link name="finish_link">
      <pose>4 4 0.01 0 0 0</pose>
      <visual name="visual">
        <geometry>
          <box><size>0.5 0.5 0.02</size></box>
        </geometry>
        <material><ambient>0 0 1 1</ambient></material>
      </visual>
    </link>
  </model>
""")

def write_footer(f):
    f.write("\n</world>\n</sdf>")

if __name__ == "__main__":
    with open("src/com760cw2_group16/world/random_world.world", "w") as f:
        write_header(f)
        write_surrounding_wall(f)
        write_random_obstacles(f)
        write_random_walls(f)
        write_start_and_finish(f)
        write_footer(f)
