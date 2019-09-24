ARG UBUNTU_VERSION=bionic

FROM ubuntu:${UBUNTU_VERSION}
ARG SRSLTE_REPO=https://github.com/srsLTE/srsLTE
ARG SRSLTE_CHECKOUT=master

RUN apt-get update \
    && apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:myriadrf/drivers \
    && apt-get update \
    && apt-get install -y \
        cmake \
        build-essential \
        git \
        libfftw3-dev \
        libmbedtls-dev \
        libboost-program-options-dev \
        libconfig++-dev \
        libsctp-dev \
        libsoapysdr-dev

RUN mkdir /srslte \
    && cd /srslte \
    && git clone --depth 1 $SRSLTE_REPO srslte \
    && cd srslte \
    && git checkout $SRSLTE_CHECKOUT \
    && cd .. \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/srslte ../srslte \
    && make -j$(ncore) install

ENTRYPOINT /bin/bash