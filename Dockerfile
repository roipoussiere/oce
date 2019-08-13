FROM nvidia/cudagl:10.1-base

LABEL source="https://github.com/CadQuery/oce/tree/master/docker/oce" \
      issues="https://github.com/CadQuery/oce/issues" \
      license="https://github.com/CadQuery/oce/blob/master/LICENSE_LGPL_21.txt"

# Update packages
RUN apt-get update && \
    apt-get -y upgrade

# Install dependencies
RUN apt-get install -y curl cmake g++ libfreetype6-dev libfontconfig1-dev freeglut3-dev

COPY . /oce
WORKDIR /oce
RUN mkdir cmake-build

RUN cd cmake-build && \
    cmake ..

RUN cd cmake-build && \
    make -j$(nproc)

RUN cd cmake-build && \
    make install/strip

RUN cd cmake-build && \
    make test
