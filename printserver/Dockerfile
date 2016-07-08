FROM ubuntu:16.04

MAINTAINER Nicolas Delaby "nicolas@ezeep.com"

# Install cups
RUN apt-get update && apt-get install cups cups-bsd cups-pdf whois python3 python3-pip -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install zebra
RUN pip3 install boto3
RUN pip3 install pystache
# Disbale some cups backend that are unusable within a container
#RUN mv /usr/lib/cups/backend/parallel /usr/lib/cups/backend-available/ &&\
#    mv /usr/lib/cups/backend/serial /usr/lib/cups/backend-available/ &&\
#    mv /usr/lib/cups/backend/usb /usr/lib/cups/backend-available/

ADD etc-cups /etc/cups
RUN mkdir -p /etc/cups/ssl
VOLUME /etc/cups/
VOLUME /var/log/cups
VOLUME /var/spool/cups
VOLUME /var/cache/cups

ADD etc-pam.d-cups /etc/pam.d/cups

#EXPOSE 631
#EXPOSE 9100

ADD start_cups.sh /root/start_cups.sh
RUN chmod +x /root/start_cups.sh
CMD ["/root/start_cups.sh"]
#CMD ["/etc/init.d/cups restart"]
