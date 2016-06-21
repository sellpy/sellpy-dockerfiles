FROM ubuntu:latest

# enable utf-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ADD install.sh /tmp/install.sh
RUN sh -e /tmp/install.sh

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +rx /tini

ADD sellpy.cabal /app/
ADD stack.yaml /app/
WORKDIR /app
RUN stack setup
RUN stack build
