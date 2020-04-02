FROM phusion/baseimage:0.11
MAINTAINER snoopy <info@medved.in>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set correct environment variables
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install airplay
RUN mkdir /var/run/dbus
RUN apt-get update
RUN apt-get install -y wget lame faad flac sox perl tzdata pv libcrypt-openssl-rsa-perl libio-socket-inet6-perl libwww-perl avahi-utils libio-socket-ssl-perl dbus avahi-daemon mpg123
#RUN wget http://www.inf.udec.cl/~diegocaro/rpi/libnet-sdp-perl_0.07-1_all.deb
#RUN wget http://www.forum-raspberrypi.de/mydownloads/downloads/libnet-sdp-perl_0.07-1_all.deb
ADD libnet-sdp-perl_0.07-1_all.deb /tmp
RUN dpkg -i /tmp/libnet-sdp-perl_0.07-1_all.deb

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

# Fix avahi-daemon not working without dbus
# RUN sed -i -e "s#\#enable-dbus=yes#enable-dbus=false#g" /etc/avahi/avahi-daemon.conf

# Add avahi-daemon to runit
RUN mkdir /etc/service/avahi-daemon
ADD avahi-daemon.sh /etc/service/avahi-daemon/run
RUN chmod +x /etc/service/avahi-daemon/run

# Fix spamming in logs
RUN echo "export NO_AT_BRIDGE=1" >> /etc/bash.bashrc


#########################################
##         RUN INSTALL SCRIPT          ##
#########################################

COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh; sync; /tmp/install.sh; sync; rm /tmp/install.sh
 
#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
VOLUME /config /music
EXPOSE 3483 3483/udp 9000 9090 5353/udp 9005 38863 46960



