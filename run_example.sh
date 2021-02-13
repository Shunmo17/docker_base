#! /bin/bash

# Default settings
IMAGE_NAME="ros1.nvidia"
TAG_NAME="melodic"
GPU="on"
GPU_OPTION=""

# Usage
function usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "    -h,--help              Show the usage."
    echo "    -g,--gpu <on|off>      Enable GPU support in the Docker."
}

# Get Option
OPTS=`getopt --options g:h \
         --long gpu:,help \
         --name "$0" -- "$@"`
eval set -- "$OPTS"

while true; do
    case "$1" in
        -g | --gpu )
            GPU="$2"
            shift 2
            ;;
        -h | --help )
            usage
            exit 0
            ;;
        --)
            if [ ! -z $2 ];
            then
                echo "Invalid parameter: $2"
                exit 1
            fi
            break
            ;;
        *)
            echo "Invalid option"
            exit 1
        ;;
    esac
done

if [ ${GPU} = "on" ]; then
    GPU_OPTION="--gpus all"
fi

xhost +local:user
docker run -it \
    $GPU_OPTION \
    --rm \
    --net host \
    --privileged \
    --name ${IMAGE_NAME} \
    --env DISPLAY=${DISPLAY} \
    --env QT_X11_NO_MITSHM=1 \
    --env ROS_MASTER_MODE=${ROS_MASTER_MODE} \
    --volume /dev:/dev \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume ${HOME}/.Xauthority:/root/.Xauthority \
    ghcr.io/shunmo17/${IMAGE_NAME}:${TAG_NAME}
