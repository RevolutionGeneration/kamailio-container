#/bin/bash

# install rabbitmq-c
git clone https://github.com/2600hz/rabbitmq-c /usr/src/rabbitmq-c
cd /usr/src/rabbitmq-c
autoreconf -fi
./configure
make && make install

# Install erlang
wget http://erlang.org/download/otp_src_R15B03-1.tar.gz -P /usr/src/
tar -C /opt/ -zxf /usr/src/otp_src_R15B03-1.tar.gz
cd /opt/otp_src_R15B03/
./configure && make && make install
ln -s /usr/local/lib/erlang/ /usr/lib/erlang

# install json
git clone https://github.com/2600hz/json-c /usr/src/json-c
cd /usr/src/json-c
autoreconf -fi
./configure
make && make install




