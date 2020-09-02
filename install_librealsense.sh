#!/bin/bash

set -e

read -r -p "Did you activate swp file and jetson_clocks? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "-- Install Librealsense2"
else
	echo "Then please do it..."
	exit 0
fi


cd ${HOME}/projects
sudo apt-get install -y libxinerama-dev libxcursor-dev
wget https://github.com/IntelRealSense/librealsense/archive/v2.38.1.zip
unzip v2.38.1.zip && rm v2.38.1.zip && mkdir ${HOME}/projects/librealsense-2.38.1/build/
cd ${HOME}/projects/librealsense-2.38.1/build/ 
cmake ../ -DFORCE_RSUSB_BACKEND=ON -DBUILD_PYTHON_BINDINGS:bool=true -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_BUILD_TYPE=release -DBUILD_EXAMPLES=true -DBUILD_GRAPHICAL_EXAMPLES=true -DBUILD_WITH_CUDA:bool=true   
make -j4
sudo make install
if ! grep '/usr/local/lib' ${HOME}/.bashrc > /dev/null ; then
  echo "-- Add Librealsense2 Libs into PYTHONPATH in ~/.bashrc"
  echo >> ${HOME}/.bashrc
  echo "PYTHONPATH=$PYTHONPATH:/usr/local/lib" >> ${HOME}/.bashrc
fi