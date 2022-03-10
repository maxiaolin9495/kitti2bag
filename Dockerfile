FROM ros:lunar-ros-base

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ros-lunar-cv-bridge \
    ros-lunar-opencv3 \
    ros-lunar-tf \
    python-pip python-matplotlib \
  && rm -rf /var/lib/apt/lists/*
COPY . /kitti2bag
RUN pip install pandas==0.23.0 && \
	  pip install progressbar2==3.41.0 && \
	  pip install python-utils==2.3.0 && \
    pip install -e /kitti2bag

WORKDIR /data

ENTRYPOINT ["/kitti2bag/docker_entrypoint.sh"]

