USER='carson'
ROS_VERSION='melodic'
GAZEBO_VERSION='gazebo9'
INSTALL_VRX='true'
INSTALL_DAVE=''
INSTALL_DAVE_MBS=''

if [[ -n $INSTALL_DAVE ]]
then
	echo "Installing Dave and dependencies"
	sleep 3s
	# Installing dependencies
	sudo apt-get update
	sudo apt-get install -y build-essential cppcheck curl cmake lsb-release git python3-dbg python3-pip python3-venv ruby software-properties-common wget libeigen3-dev pkg-config protobuf-compiler qtbase5-dev libgles2-mesa-dev -y

	sudo apt-get install ros-$ROS_VERSION-rqt-robot-plugins ros-$ROS_VERSION-effort-controllers ros-$ROS_VERSION-joy ros-$ROS_VERSION-teleop-twist-joy ros-$ROS_VERSION-teleop-twist-keyboard ros-$ROS_VERSION-teleop-tools ros-$ROS_VERSION-joy-teleop ros-$ROS_VERSION-key-teleop ros-$ROS_VERSION-geographic-info ros-$ROS_VERSION-move-base ros-$ROS_VERSION-robot-localization ros-$ROS_VERSION-robot-state-publisher ros-$ROS_VERSION-xacro ros-$ROS_VERSION-rqt ros-$ROS_VERSION-rqt-common-plugins ros-$ROS_VERSION-hector-gazebo-plugins -y

	mkdir -p /home/$USER/uuv_ws/src
	cd /home/$USER/uuv_ws/src

	git clone https://github.com/Field-Robotics-Lab/dave.git
	git clone https://github.com/Field-Robotics-Lab/nps_uw_sensors_gazebo.git
	git clone https://github.com/Field-Robotics-Lab/gtri_based_sonar.git
	git clone https://github.com/Field-Robotics-Lab/uuv_simulator
	git clone https://github.com/Field-Robotics-Lab/uuv_manipulators
	git clone https://github.com/uuvsimulator/eca_a9.git
	git clone https://github.com/uuvsimulator/rexrov2.git
	git clone https://bitbucket.org/whoidsl/ds_sim.git
	git clone https://bitbucket.org/whoidsl/ds_msgs.git

	cd ..
	catkin_make
fi

if [[ -n $INSTALL_VRX ]]
then
	echo "Installing VRX and dependencies"
	sleep 3s
	# Install dependencies
	sudo apt-get update
	sudo apt install cmake mercurial git ruby libeigen3-dev lib$GAZEBO_VERSION-dev pkg-config python ros-$ROS_VERSION-gazebo-plugins ros-$ROS_VERSION-gazebo-ros ros-$ROS_VERSION-hector-gazebo-plugins ros-$ROS_VERSION-joy ros-$ROS_VERSION-joy-teleop ros-$ROS_VERSION-key-teleop ros-$ROS_VERSION-robot-localization ros-$ROS_VERSION-robot-state-publisher ros-$ROS_VERSION-joint-state-publisher ros-$ROS_VERSION-rviz ros-$ROS_VERSION-ros-base ros-$ROS_VERSION-teleop-tools ros-$ROS_VERSION-teleop-twist-keyboard ros-$ROS_VERSION-velodyne-simulator ros-$ROS_VERSION-xacro ros-$ROS_VERSION-rqt ros-$ROS_VERSION-rqt-common-plugins protobuf-compiler -y


	mkdir -p /home/$USER/vrx_ws/src
	cd /home/$USER/vrx_ws/src
	git clone https://github.com/osrf/vrx
	source /opt/ros/$ROS_VERSION/setup.bash
	cd ..
	catkin_make
fi
