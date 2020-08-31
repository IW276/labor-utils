#!/bin/bash

set -e

echo "-- Install Updates..."
sudo apt-get update
sudo apt-get upgrade -y

echo "-- Install usefull utilies.."
sed 's/#.*//' xargs -a requirements/apt.txt sudo apt-get install
sudo -H pip3 install -U jetson-stats
sudo -H pip3 install -U  Cython
sudo pip3 install numpy matplotlib
#Docker
sudo cp ${HOME}/project/labor-utils/docker/daemon.json /etc/docker/daemon.json
# Downdload L4T Pytorch Container 32.4.3
sudo docker pull nvcr.io/nvidia/l4t-pytorch:r32.4.3-pth1.6-py3

echo "-- Reboot in one minute..."
sudo shutdown -r 0