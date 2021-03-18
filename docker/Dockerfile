# syntax = docker/dockerfile:experimental
FROM ibmcom/powerai:1.7.0-pytorch-ubuntu18.04-py37-ppc64le-21.035

# Arguments
ARG USER=pwrai
ARG GROUP=pwrai
ARG UID=2051
ARG GID=2051
ARG SHELL=/bin/bash

USER root

# Setup users and groups
RUN mkdir -p /etc/sudoers.d \
  && echo "${USER}:x:${UID}:${UID}:${USER},,,:/home/pwrai:${shell}" >> /etc/passwd \
  && echo "${USER}:x:${UID}:" >> /etc/group \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
  && chmod 0440 "/etc/sudoers.d/${USER}"

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

# # Install packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget curl git tree \
    vim byobu nano htop \
    llvm-7-dev \
    libjpeg-dev \
    libssl-dev \
    libblas-dev \
    liblapack-dev \
    gfortran \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libpng-dev \
    pkg-config \
    python3-pip \
    python3-wheel \
    python3.7-dev \
    python3-setuptools \
    build-essential \
    python3.7 \
    ffmpeg \
  && ln -s /usr/bin/llvm-config-10 /usr/bin/llvm-config \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV LLVM_CONFIG=/usr/bin/llvm-config-7

USER ${USER}

# setup custom configuration
COPY config /home/${USER}/.tmp
RUN  sh -c "cat /home/${USER}/.tmp/bashrc/* >> /home/${USER}/.bashrc" \
  && python3.7 -m pip install -U pip Cython \
  && python3.7 -m pip install -r /home/${USER}/.tmp/pip/requirements.txt \
  && sudo rm -rf /home/${USER}/.tmp

# Switch user to pwrai
RUN sudo mkdir work

# Make SSH available
EXPOSE 22

# Switch to user's HOME folder
WORKDIR /home/${USER}/work

# ENTRYPOINT ["terminator"]
ENTRYPOINT ["byobu"]
