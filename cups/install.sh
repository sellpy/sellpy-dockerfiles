#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
# locked cups version since 2.2.7-1ubuntu2.1 for some reason didn't delete the data job files in /spool
apt-get install -y \
  cups=2.1.3-4ubuntu0.4 \
  automake \
  autoconf \
  gcc \
  ghostscript \
  poppler-utils \
  netpbm \
  build-essential \
  sudo
apt-get clean
