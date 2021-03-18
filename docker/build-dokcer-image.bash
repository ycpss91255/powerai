#!/bin/bash

file_dir=`dirname $0`

# get parameter from system

export DOCKER_BUILDKIT=1

DOCKER_IMAGE_NAME=liu_voicefilter

# build docker images
docker build -t pwrai/${DOCKER_IMAGE_NAME} \
    ${file_dir}
