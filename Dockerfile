ARG BASE_IMAGE=adamrehn/ue4-full:4.26.1-cudagl10.2
FROM $BASE_IMAGE

USER root
RUN apt-get update
RUN apt-get install \
    rsync \
    sudo \
    wget \
    x11-xserver-utils \
    -y --no-install-recommends

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    adduser ue4 sudo

USER ue4
RUN cd /home/ue4 && \
    git clone --progress https://github.com/Microsoft/AirSim.git && \
    cd AirSim && \
    ./setup.sh && \
    ./build.sh

WORKDIR /home/ue4
