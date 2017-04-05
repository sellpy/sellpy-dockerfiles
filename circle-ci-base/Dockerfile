FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CLOUD_SDK_REPO="cloud-sdk-xenial"

RUN apt-get update && apt-get -y install git curl apt-transport-https python-pip python-dev
RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get update && apt-get -y install google-cloud-sdk

