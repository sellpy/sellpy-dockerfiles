FROM ubuntu:latest
MAINTAINER Fabian Linzberger <e@lefant.net>

ADD install.sh /tmp/install.sh
RUN sudo sh /tmp/install.sh

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# must be installed before scikit-learn
RUN pip3 install scipy

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

ADD matplotlibrc /root/.config/matplotlib/matplotlibrc
