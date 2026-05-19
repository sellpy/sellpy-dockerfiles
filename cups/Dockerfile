FROM ubuntu:24.04

RUN apt-get update && apt-get install -y cups && apt-get clean

# Enable utf-8 locale
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Copy local configuration file to container
COPY cupsd.conf /etc/cups/

CMD ["/usr/sbin/cupsd", "-f"]
