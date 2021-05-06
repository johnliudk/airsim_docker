# Docker for AirSim build and deploy <!-- no toc -->

- [Docker for AirSim build and deploy](#docker-for-airsim-build-and-deploy)
  - [UE4 Docker for running AirSim](#ue4-docker-for-running-airsim)
    - [Build UE4 Docker](#build-ue4-docker)
    - [Build AirSim image](#build-airsim-image)
- [Run AirSim UE4](#run-airsim-ue4)
  - [Start container](#start-container)
  - [Start UE4 Editor](#start-ue4-editor)
  - [Build environment](#build-environment)
- [Run Airsim Binary](#run-airsim-binary)
  - [Start ue4-runtime container](#start-ue4-runtime-container)
  - [Run binary](#run-binary)
    - [Run with OpenGL](#run-with-opengl)
    - [Render headless](#render-headless)
    - [Render in windowed mode](#render-in-windowed-mode)
  - [Multiple instance with docker-compose](#multiple-instance-with-docker-compose)

## UE4 Docker for running AirSim

### Build UE4 Docker

- Build UE4 with CUDA. Only full image of UE4 Engine >=4.25.0 has Vulkan support.

```bash
ue4-docker build 4.26.2 --cuda=10.2
```

- (Optional) Clean up the intermediate images from the build to save space

```bash
ue4-docker clean --source
```

### Build AirSim image

```bash
docker build -t airsim_source:4.26.2-cudagl10.2 --build-arg BASE_IMAGE=adamrehn/ue4-full:4.26.2-cudagl10.2 .
```

# Run AirSim UE4

## Start container

```bash
./script/run_airsim_source.sh airsim_source:4.26.2-cudagl10.2
```

## Start UE4 Editor

```bash
/home/ue4/UnrealEngine/Engine/Binaries/Linux/UE4Editor
```

Follow official [documentation](https://microsoft.github.io/AirSim/build_linux/#how-to-use-airsim) to build and play environment.

## Build environment

Specific save directory with `-archivedirectory` and project directory with `-project`:

```bash
/home/ue4/UnrealEngine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun -platform=Linux \
  -clientconfig=Shipping -serverconfig=Shipping -noP4 -cook -allmaps -build -stage -prereqs -pak -archive \
  -archivedirectory=/home/ue4/Binaries/Blocks/ \
  -project=/home/ue4/AirSim/Unreal/Environments/Blocks/Blocks.uproject
```

# Run Airsim Binary

## Start ue4-runtime container

```bash
# with VirtualGL
./script/run_airsim_binary.sh

# complete headless
./script/run_airsim_binary_headless.sh
```

## Run binary

Binaries are mounted at `/home/ue4/Binaries`.

### Run with OpenGL

Add `-opengl4`

### Render headless

Add `-RenderOffScreen`.

### Render in windowed mode

Add `-windowed -ResX 1280 -ResY 720`

## Multiple instance with docker-compose

```bash
docker-compose up --scale blocks=3
```
