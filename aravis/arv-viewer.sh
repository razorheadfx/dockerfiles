#!/bin/sh
# before starting this script run: xhost +local:docker
# to allow docker access to the x socket

# aravis needs access to the interfaces for the discovery part so we need net=host

docker run --rm -i -t \
    --net=host \
    -v /dev/bus/usb:/dev/bus/usb \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    aravis \
          /bin/bash -c "arv-viewer"