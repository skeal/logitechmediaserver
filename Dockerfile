FROM phusion/baseimage:0.9.18
MAINTAINER snoopy <info@medved.in>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set correct environment variables
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get remove -y avahi-daemon
RUN apt-get purge -y avahi-daemon
RUN rm -rvf /etc/avahi/

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################

COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh; sync; /tmp/install.sh; sync; rm /tmp/install.sh
 
#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
VOLUME /config /music /etc/avahi
EXPOSE 3483 3483/udp 9000 9090


