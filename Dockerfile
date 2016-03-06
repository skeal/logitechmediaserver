FROM phusion/baseimage:0.9.18
MAINTAINER snoopy <info@medved.in>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set correct environment variables
ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##         RUN INSTALL SCRIPT          ##
#########################################
RUN apt-get update

RUN apt-get install --yes perlbrew git libssl-dev

# Install perl to perlbrew
RUN perlbrew init && \
    perlbrew install perl-5.20.0 && \
    perlbrew switch perl-5.20.0 && \
    perlbrew install-cpanm


# Install perl modules
RUN perlbrew exec cpanm \
        Module::Install && \
    perlbrew exec cpanm \
        DBI \
        EV \
		XML::Parser::Expat \
		HTML::Parser \
		JSON::XS \
		Digest::SHA1 \
		YAML::XS
		

# Install perl modules 
#RUN apt-get install -y cpanminus

#RUN cpanm Sub::Name \
 #DBI \ 
 #EV \
 #XML::Parser::Expat \
 #HTML::Parser \
 #JSON::XS \
 #Digest::SHA1 \
 #YAML::XS

COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh; sync; /tmp/install.sh; sync; rm /tmp/install.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
VOLUME /config /music
EXPOSE 3483 3483/udp 9000 9090