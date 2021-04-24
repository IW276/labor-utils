#!/bin/bash

set -e

echo "-- Install Updates..."
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
echo "-- Install usefull utilies.."
sed 's/#.*//' requirements/apt.txt | xargs sudo apt-get install -y
sudo -H pip3 install -U jetson-stats
sudo -H pip3 install -U  Cython
sudo -H pip3 install -U numpy
#Docker
sudo cp ${HOME}/projects/labor-utils/docker/daemon.json /etc/docker/daemon.json
# Downdload L4T Pytorch Container 32.5.30
sudo docker pull nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.7-py3

echo "-- Reboot in one minute..."
sudo shutdown -r 0
