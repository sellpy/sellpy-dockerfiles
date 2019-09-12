# lock version to 16.04 in order to not get a cups version that doesn't delete job data files
FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get install -y locales

# enable utf-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV TERM xterm

ADD install.sh /tmp/install.sh
RUN sh -e /tmp/install.sh

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +rx /tini

# install intermec drivers
ADD drivers ./drivers
RUN cd ./drivers && tar -zxvf cupsdriver-1.2-56.tar.gz && cd cupsdriver-1.2-56 && ./build.sh

# increase max jobs in queue (from default 500) to handle large batches (e.g. freight labels for standard containers)
# adds "MaxJobs 10000" to first line of cupsd.conf
RUN sed -i '1s/^/MaxJobs 10000\n/' /etc/cups/cupsd.conf

# Finally fixed the issue that I attempted to fix in
# https://github.com/sellpy/sellpy-dockerfiles/commit/b573e7eb300b6fd93a793852f5928755402e120a (and made a workaround in later commits)
# The issue was that a bug (https://bugs.launchpad.net/ubuntu/+source/cups/+bug/1747765)
# was corrected in (https://launchpad.net/ubuntu/+source/cups/2.1.3-4ubuntu0.9) which made the "seconds" value to be working correctly
# for PreserveJobFiles. And since the default value was 86400 (1 day) it broke our counter "Jobs in the printer queue".
RUN sed -i '1s/^/PreserveJobFiles No\n/' /etc/cups/cupsd.conf

# Also delete job history (d* files in /var/spool/cups are JobFiles and c* are JobHistory)
# Delete in order to prevent memory usage from spiking resulting in slow prints (especially when MaxJobs was increased from 500 to 10000)
RUN sed -i '1s/^/PreserveJobHistory No\n/' /etc/cups/cupsd.conf

ENTRYPOINT ["/tini", "--"]
CMD ["/usr/sbin/cupsd", "-f"]
