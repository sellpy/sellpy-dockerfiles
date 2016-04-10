#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update

PACKAGES=$(xargs <<EOF
curl
EOF
)

apt-get install -y $PACKAGES
apt-get clean
