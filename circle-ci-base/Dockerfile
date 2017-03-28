FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install git curl python-pip python-dev

RUN pip install docker-cloud
ENV DOCKERCLOUD_USER=tech@sellpy.se
ENV DOCKERCLOUD_PASS=qOuCP7KQo4y2aDcYtKhu
ENV DOCKERCLOUD_NAMESPACE=sellpy
