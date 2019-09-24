FROM ubuntu:bionic

# install deps
# including those for usb and packet support,
# the gstreamer plugin and the viewer
# the viewer also requires gstreamer plugin collections good and bad
RUN apt-get update \
&& apt-get install -y \
    build-essential \
    make \
    intltool \
    iputils-ping \
    libaudit-dev \
    libglib2.0-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-tools \
    libgtk-3-dev \
    libnotify-dev \
    libusb-1.0-0-dev \
    libxml2-dev \
    wget \
&& rm -rf /var/lib/apt/lists/*

# download the stable sources, rename the file
# unpack it into the /aravis folder and remove one layer of folders while doing so
# then delete the archive
RUN wget -c http://ftp.acc.umu.se/pub/GNOME/sources/aravis/0.6/aravis-0.6.4.tar.xz -O aravis.tar.xz \
&& mkdir /aravis \
&& tar -xf aravis.tar.xz -C /aravis --strip-components 1 \
&& rm aravis.tar.xz

# a of now this build process only works for the LTS versions because the dev version
# uses meson instead of autotools
RUN cd /aravis \
&&./configure --enable-viewer --enable-gst-plugin --enable-usb \
&& make \
&& make install

ENV GST_PLUGIN_PATH /usr/local/lib/gstreamer-1.0
ENV LD_LIBRARY_PATH /usr/local/lib/