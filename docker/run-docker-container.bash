#!/bin/bash

# start sharing xhost
xhost +local:root

DOCKER_IMAGE_NAME=liu_voicefilter
DOCKER_CONTAINER_NAME=voicefilter
WORKSPACE_PATH=$HOME/workspace/liu_ws

# run docker
docker run --rm \
  --net=host \
  --ipc=host \
  --gpus all \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:$docker/.Xauthority \
  -v ${WORKSPACE_PATH}:/home/pwrai/work \
  -e XAUTHORITY=$home_folder/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it --name $DOCKER_CONTAINER_NAME pwrai/${DOCKER_IMAGE_NAME}
