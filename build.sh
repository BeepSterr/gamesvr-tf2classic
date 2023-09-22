#!/bin/bash
set -e;
set -u;

##
## This script will do a full update to gamesvr-tf2, so it can then be pushed to
## DockerHUB
##

echo -e '\n\033[1m[Build Image]\033[0m'
docker build . -f linux.Dockerfile --rm -t beepsterr/gamesvr-tf2classic:latest --no-cache --pull --build-arg BUILDNODE="$(cat /proc/sys/kernel/hostname)";


echo -e '\n\033[1m[Running Self-Checks]\033[0m'
docker run -it --rm beepsterr/gamesvr-tf2classic:latest ./ll-tests/gamesvr-tf2classic.sh


echo -e '\n\033[1m[Pushing to Docker Hub]\033[0m'
echo "> push beepsterr/gamesvr-tf2:base"
docker push beepsterr/gamesvr-tf2classic:latest
