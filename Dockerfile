# Jenkins.
FROM ubuntu:14.04
MAINTAINER Michal @ Revolution Generation <michal@revolutiongeneration.co.uk>

# Enable the Ubuntu multiverse repository.
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse">> /etc/apt/source.list
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/source.list

# Install Dependencies.
RUN apt-get update && apt-get install -y vim-nox git gcc automake build-essential flex bison libncurses5-dev unixodbc-dev xsltproc libssl-dev libmysqlclient-dev make libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev uuid-dev libicu-dev libunistring-dev libsnmp-dev libevent-dev autoconf libtool wget libconfuse-dev

# Install source code dependencies.
ADD build/install-deps.sh /root/install-deps.sh
WORKDIR /root
RUN chmod +x install-deps.sh
RUN ./install-deps.sh
RUN rm install-deps.sh

# build kamailio
RUN git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio -b 4.4 /usr/src/kamailio
WORKDIR /usr/src/kamailio
RUN make cfg
ADD build/modules.lst /usr/src/kamailio/modules.lst
RUN make all && make install

ENV PATH=$PATH:/usr/local/sbin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Copy config files
ADD conf/kamailio/* /etc/kamailio/
RUN mkdir /etc/kamailio/dbtext
ADD conf/kamailio/dbtext/* /etc/kamailio/dbtext/
RUN mkdir /etc/kamailio/certs
ADD conf/kamailio/certs/* /etc/kamailio/certs

ADD conf/default/kamailio /etc/default/kamailio

RUN ln -s /usr/local/lib64 /usr/lib64

EXPOSE 5060 5061 7000 7001 5064 5065

CMD ["kamailio -f /etc/kamailio/kamailio.cfg"]




