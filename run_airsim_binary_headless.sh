docker run -it --rm \
    -v $(pwd)/Binaries:/home/ue4/Binaries \
    -v $(pwd)/settings_headless.json:/home/ue4/Documents/AirSim/settings.json \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    adamrehn/ue4-runtime:18.04-cudagl10.2 bash
