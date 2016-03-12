FROM phusion/baseimage:0.9.18
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
RUN apt-get install -y wget libcrypt-openssl-rsa-perl libio-socket-inet6-perl libwww-perl avahi-utils libio-socket-ssl-perl dbus
RUN wget http://www.inf.udec.cl/~diegocaro/rpi/libnet-sdp-perl_0.07-1_all.deb
RUN dpkg -i libnet-sdp-perl_0.07-1_all.deb

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################

COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh; sync; /tmp/install.sh; sync; rm /tmp/install.sh
 
#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
VOLUME /config /music
EXPOSE 3483 3483/udp 9000 9090 5353/udp 9005


