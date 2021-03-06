#!/bin/bash

set -e

if ! grep 'cuda/bin' ${HOME}/.bashrc > /dev/null ; then
  echo "-- Add CUDA Libs into ~/.bashrc"
  echo >> ${HOME}/.bashrc
  echo "export PATH=/usr/local/cuda/bin\${PATH:+:\${PATH}}" >> ${HOME}/.bashrc
  echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64" >> ${HOME}/.bashrc
fi