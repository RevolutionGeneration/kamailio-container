Kamailio Dockerfile
===================

This project can be used to deploy a Kamailio server inside a Docker container.

## Start

```
 docker run \
  -h node1.domain.com \
  -e MY_HOSTNAME=node1.domain.com \
  -e MY_IP_ADDRESS=0.0.0.0 \
  -e MY_AMQP_URL=kazoo://guest:guest@127.0.0.1:5672 \
  -tid \
  -v /root/.ssl/key.pem:/etc/kamailio/certs/key.pem:ro \
  -v /root/.ssl/cert.pem:/etc/kamailio/certs/cert.pem:ro \
  -e FREESWITCH=freeswitch:11000 \
  --name kamailio \
  --name kamailio \
  revgen/kamailio-container \
  /bin/bash
``` 

for backup sip server, `use -e FREESWITCH_BACKUP=`

