FROM debian:latest
MAINTAINER Leds "ledsifes@gmail.com"


RUN apt-get update &&\
    apt-get install -y openssh-server &&\
    apt-get install -y sudo &&\
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list && \
    TMPNAME=$(tempfile) && \
    apt-get update >> /dev/null 2> $TMPNAME && \
    PGPKEY=`cat $TMPNAME | cut -d":" -f6 | cut -d" " -f3` && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $PGPKEY && \
    rm $TMPNAME && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer oracle-java8-set-default  && \
    apt-get install -y maven && \
    apt-get install -y git  && \	

   mkdir  /usr/local/sincap && \
   git clone https://github.com/LEDS/sincap-entities.git /usr/local/sincap && \
   git clone https://github.com/LEDS/sincap-webservice.git /usr/local/sincap && \
   git clone https://github.com/LEDS/sincap-interface-web.git /usr/local/sincap && \

    #Clean up apt-repository
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


