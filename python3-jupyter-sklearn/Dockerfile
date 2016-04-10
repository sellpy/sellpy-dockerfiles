FROM ubuntu:latest
# MAINTAINER Fabian Linzberger <e@lefant.net>

ADD install.sh /tmp/install.sh
RUN sudo sh /tmp/install.sh

ADD install2.sh /tmp/install2.sh
RUN sudo sh /tmp/install2.sh

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

ADD requirements2.txt /tmp/requirements2.txt
RUN pip3 install -r /tmp/requirements2.txt
