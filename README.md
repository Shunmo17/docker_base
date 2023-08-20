# docker base

## Description

This repository has Dockerfiles to build docker base images. These images are built automatically by GitHub Actions and published to GitHub Container Registry (ghcr). 

You can check built images in https://github.com/Shunmo17?tab=packages.

## Image Names and Tags

### ubuntu base image

`ubuntu20.04`, `ubuntu20.04-cuda11.7`, `ubuntu20.04-cuda11.7-pytorch2.0.0`

ex: `base:ubuntu20.04-cuda11.7`

### ros1 base image

`noetic`, `noetic-cuda11.7`, `noetic-cuda11.7-pytorch2.0.0`

ex: `ros1:noetic-cuda11.7`

### ros2 base image

`foxy`

ex: `ros2:dashing`

*ROS2 image is experimental version. 


## Usage

```
docker pull ghcr.io/shunmo17/<Image Name>:<Tag Name>
```
