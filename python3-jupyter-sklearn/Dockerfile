FROM ubuntu:latest
MAINTAINER Fabian Linzberger <e@lefant.net>

ADD install.sh /tmp/install.sh
RUN sudo sh /tmp/install.sh

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# must be installed before scikit-learn
RUN pip3 install numpy>=1.11.0
RUN pip3 install scipy>=0.17.0

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
