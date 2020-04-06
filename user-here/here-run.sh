#!/bin/bash
docker kill $(docker ps -q)
docker run -it --rm -v/mnt/here:/mnt/here --security-opt seccomp=unconfined -p 8080:8080 $*
