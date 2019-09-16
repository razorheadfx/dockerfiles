#!/bin/sh
# before starting this script run: xhost +local:docker
# to allow docker access to the x socket

# aravis needs access to the interfaces for the discovery part so we need net=host

docker run --rm -i -t \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    aravis \
          /bin/bash -c "LD_LIBRARY_PATH=/usr/local/lib/ NO_AT_BRIDGE=1 arv-viewer"