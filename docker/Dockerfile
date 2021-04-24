FROM nvcr.io/nvidia/l4t-pytorch:r32.5.0-pth1.7-py3
RUN echo "Build Example TRT Pose Container based on L4T Pytorch"
RUN nvcc --version

RUN pip3 install tqdm --verbose
RUN pip3 install cython --verbose
RUN pip3 install pycocotools --verbose

RUN git clone https://github.com/NVIDIA-AI-IOT/trt_pose

RUN cd trt_pose && \
    python3 setup.py install
