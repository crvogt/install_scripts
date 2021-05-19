echo "Installing ROS"

ROS_VERSION='noetic'
GAZEBO_VERSION='gazebo11'

# Check if a ROS install exists via opt ROS directory


# Install ROS dependencies
# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Update and install
sudo apt-get update
sudo apt-get install ros-$ROS_VERSION-desktop-full

source /opt/ros/$ROS_VERSION/setup.bash
echo "source /opt/ros/$ROS_VERSION/setup.bash" >> /home/$USER/.bashrc
source /home/$USER/.bashrc

# Setup sources list
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

# Setup keys
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

# update
sudo apt-get update
sudo apt-get install $GAZEBO_VERSION
