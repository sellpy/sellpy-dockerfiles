#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
build-essential
curl
git

gphoto2
libgphoto2-6
libgphoto2-dev

ttf-bitstream-vera
EOF
)

apt-get install -y $PACKAGES
apt-get clean
