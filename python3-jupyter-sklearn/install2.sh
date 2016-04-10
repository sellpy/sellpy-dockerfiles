#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update

PACKAGES=$(xargs <<EOF
python3-matplotlib
python3-seaborn
EOF
)

apt-get install -y $PACKAGES
apt-get clean
