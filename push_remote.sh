REGISTRY_NAME=mochizushun-nas.synology.me
REGISTRY_PORT=36049

for UBUNTU in "16.04" "18.04" "20.04"
do
    if [ ${UBUNTU} = "16.04" ]; then CUDA="10.1-devel"; ROS="kinetic"; fi
    if [ ${UBUNTU} = "18.04" ]; then CUDA="10.1-devel"; ROS="melodic"; fi
    if [ ${UBUNTU} = "20.04" ]; then CUDA="11.0-devel"; ROS="noetic"; fi
    docker tag shunmo17/ubuntu:${UBUNTU} ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu:${UBUNTU}
    docker tag shunmo17/ubuntu.nvidia:${UBUNTU} ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu.nvidia:${UBUNTU}
    docker tag shunmo17/ubuntu.nvidia:${UBUNTU}-cuda${CUDA} ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu.nvidia:${UBUNTU}-cuda${CUDA}

    docker tag shunmo17/ros1:${ROS} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1:${ROS}
    docker tag shunmo17/ros1.nvidia:${ROS} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1.nvidia:${ROS}
    docker tag shunmo17/ros1.nvidia:${ROS}-cuda${CUDA} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1.nvidia:${ROS}-cuda${CUDA}

    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu:${UBUNTU}
    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu.nvidia:${UBUNTU}
    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ubuntu.nvidia:${UBUNTU}-cuda${CUDA}

    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1:${ROS}
    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1.nvidia:${ROS}
    docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros1.nvidia:${ROS}-cuda${CUDA}
done

UBUNTU="18.04"; CUDA="10.1-devel"; ROS="dashing"
docker tag shunmo17/ros2:${ROS} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2:${ROS}
docker tag shunmo17/ros2.nvidia:${ROS} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2.nvidia:${ROS}
docker tag shunmo17/ros2.nvidia:${ROS}-cuda${CUDA} ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2.nvidia:${ROS}-cuda${CUDA}
    
docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2:${ROS}
docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2.nvidia:${ROS}
docker push ${REGISTRY_NAME}:${REGISTRY_PORT}/ros2.nvidia:${ROS}-cuda${CUDA}