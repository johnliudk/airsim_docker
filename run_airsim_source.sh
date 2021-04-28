DOCKER_IMAGE_NAME=$1

nvidia-docker run -it --rm \
    -v $(pwd)/Binaries:/home/ue4/Binaries \
    -v $(pwd)/config/settings.json:/home/airsim_user/Documents/AirSim/settings.json \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=$DISPLAY \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    $DOCKER_IMAGE_NAME bash
