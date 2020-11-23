# docker base

## Description

This repository has Dockerfiles to build docker base images. These images are built automatically by GitHub Actions and published to GitHub Container Registry (ghcr). 

You can check built images in https://github.com/Shunmo17?tab=packages.



## Image Names and Tags

### ubuntu base image

`16.04`, `18.04`, `20.04`

ex: `ubuntu:16.04`

*If you use repository name `ubuntu.nvidia` instead of `ubuntu`, you can use nvidia gpu in your docker container.



### ros1 base image

`kinetic`, `melodic`, `noetic`

ex: `ros1:kinetic`

*If you use repository name `ubuntu.nvidia` instead of `ubuntu`, you can use nvidia gpu in your docker container.



### ros2 base image

`dashing`

ex: `ros2:dashing`

*If you use repository name `ubuntu.nvidia` instead of `ubuntu`, you can use nvidia gpu in your docker container.



## Usage

```
docker pull ghcr.io/shunmo17/<Image Name>:<Tag Name>
```

