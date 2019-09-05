#!/bin/sh
# before starting this script run: xhost +local:docker
# to allow docker access to the x socket
docker run --rm -i -t \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --cap-add NET_ADMIN \
    aravis \
        /bin/bash -c "LD_LIBRARY_PATH=/usr/local/lib/ NO_AT_BRIDGE=1 arv-viewer"