#!/bin/bash

docker build \
    --rm \
    --tag shunmo17/ros2:dashing \
    --build-arg BASE_IMAGE=shunmo17/ubuntu.nvidia:18.04 \
    --build-arg UBUNTU=18.04 \
    --build-arg ROS_DISTRO=dashing \
    --file ros2/Dockerfile \
    .
