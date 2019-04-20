#!/bin/sh
mkdir /etc/default
echo DOCKER_OPTS="--registry-mirror=https://docker.mirrors.ustc.edu.cn/" >> /etc/default/docker