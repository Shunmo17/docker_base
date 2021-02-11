##############################################################################
##                                 Base Image                               ##
##############################################################################
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

##############################################################################
##                                 ROS2 Install                             ##
##############################################################################
# Set locate
RUN apt update && apt install -y \
    language-pack-ja-base \
    language-pack-ja \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

# Add the ROS 2 apt repository
RUN apt update && apt install -y \
    curl \
    gnupg2 \
    lsb-release
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

# ROS2 distro
ARG ROS_DISTRO
ENV ROS_DISTRO ${ROS_DISTRO}

# Install ROS2 packages
RUN apt update && apt install -y \
    ros-${ROS_DISTRO}-desktop \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-argcomplete \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
RUN rosdep init && rosdep update

# Install ros melodic to bridge ROS1
RUN apt update \
    && apt install -my wget gnupg \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-latest.list
RUN apt update && apt install -y \
    ros-melodic-desktop-full \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional packages using ROS1 packages
RUN apt update && apt install -y \
    ros-${ROS_DISTRO}-ros1-bridge \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# set entrypoint (source /opt/ros/${ROS_DISTRO}/setup.bash)
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

##############################################################################
##                           Make ROS Workspace                             ##
##############################################################################
RUN mkdir -p /ros2_ws/src
WORKDIR /ros2_ws
RUN	/bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; colcon build --symlink-install"
COPY common/ros_entrypoint.sh /ros_entrypoint.sh
