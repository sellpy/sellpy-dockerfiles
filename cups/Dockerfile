FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  cups \
  automake \
  autoconf \
  gcc \
  ghostscript \
  poppler-utils \
  netpbm \
  build-essential \
  && apt-get clean

# Enable utf-8 locale
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Used by driver build script
ENV TERM=xterm

# Install intermec drivers
ADD drivers ./drivers
RUN cd ./drivers && tar -zxvf cupsdriver-1.2-56.tar.gz && cd cupsdriver-1.2-56 && ./build.sh

# Copy local configuration file to container
COPY cupsd.conf /etc/cups/

CMD ["/usr/sbin/cupsd", "-f"]
