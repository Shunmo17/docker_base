##############################################################################
##                                 Base Image                               ##
##############################################################################
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

##############################################################################
##                                ROS1 Install                              ##
##############################################################################
# ros distro
ARG ROS_DISTRO
ENV ROS_DISTRO ${ROS_DISTRO}

# setup keys
RUN apt update && apt install -my \
    wget gnupg \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
## for kinetic (16.04)
RUN if [ "${ROS_DISTRO}" = "kinetic" ]; then \
    echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros1-latest.list; \
    fi
## for melodic (18.04)
RUN if [ "${ROS_DISTRO}" = "melodic" ]; then \
    echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-latest.list; \
    fi
RUN if [ "${ROS_DISTRO}" = "noetic" ]; then \
    echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list; \
    fi

# install ros
RUN apt update && apt install -y \
    ros-${ROS_DISTRO}-desktop-full \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# install dependecies
RUN if [ ${ROS_DISTRO} = "noetic" ]; then \
        apt update && apt install -y \
        python3-rosdep \
        python3-rosinstall \
        python3-rosinstall-generator \
        python3-wstool \
        python3-catkin-tools \
        python3-vcstool \
        build-essential \ 
        python3-pip \
        && pip3 install osrf-pycommon \
        && apt clean \
        && rm -rf /var/lib/apt/lists/*; \
    else apt update && apt install -y \
        python-rosdep \
        python-rosinstall \
        python-rosinstall-generator \
        python-wstool \
        python-catkin-tools \
        build-essential \ 
        && apt clean \
        && rm -rf /var/lib/apt/lists/*; \
    fi

# initiliaze rosdep
RUN rosdep init && rosdep update

# set entrypoint
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

##############################################################################
##                              Ros Initialize                              ##
##############################################################################
RUN mkdir -p catkin_ws/src

WORKDIR /catkin_ws
RUN	/bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; catkin init"

RUN echo "source /ros_setting.sh" >> ~/.bashrc && \
    echo "source /catkin_build.bash" >> ~/.bashrc
