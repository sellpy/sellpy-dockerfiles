#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends openjdk-7-jre-headless python3 python3-pip python3-setuptools
apt-get clean
