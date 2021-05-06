docker run -it --rm \
    -v $(pwd)/Binaries:/home/ue4/Binaries \
    -v $(pwd)/config/settings.json:/home/ue4/Documents/AirSim/settings.json \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    adamrehn/ue4-runtime:18.04-cudagl10.2-virtualgl bash /home/ue4/Binaries/Blocks/LinuxNoEditor/Blocks.sh -windowed
