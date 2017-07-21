#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
build-essential
curl
git
nano
wget
python3-dev
python3-setuptools
python3-tk
python3-wheel
python-psycopg2
python3-pip

gfortran
swig
libagg-dev
libatlas-dev
libffi-dev
libfreetype6-dev
liblapack-dev
libncurses5-dev
libopenblas-dev
libpng12-dev
libpq-dev
libxft-dev
libxml2-dev
libxslt-dev
zlib1g-dev

ttf-bitstream-vera
EOF
)

apt-get install -y $PACKAGES
apt-get clean

#pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.1-cp34-cp34m-linux_x86_64.whl
