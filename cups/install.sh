#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install -y \
  cups \
  automake \
  autoconf \
  gcc \
  ghostscript \
  poppler-utils \
  netpbm \
  build-essential \
  sudo
apt-get clean