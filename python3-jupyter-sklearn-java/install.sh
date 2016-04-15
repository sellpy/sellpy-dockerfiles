#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends openjdk-7-jre-headless
apt-get clean
