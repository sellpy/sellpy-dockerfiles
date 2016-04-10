#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y


PACKAGES=$(xargs <<EOF
build-essential
curl

python3-setuptools
python3-dev
python3-numpy
python3-wheel

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
libxft-dev
libxml2-dev
libxslt-dev
zlib1g-dev
EOF
)

apt-get install -y $PACKAGES
apt-get clean
