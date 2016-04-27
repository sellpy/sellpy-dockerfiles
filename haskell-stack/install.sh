#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
echo 'deb http://download.fpcomplete.com/ubuntu xenial main' > /etc/apt/sources.list.d/fpco.list
apt-get update
apt-get upgrade -y

PACKAGES=$(xargs <<EOF
build-essential
curl
git

stack
EOF
)

apt-get install -y $PACKAGES
apt-get clean
