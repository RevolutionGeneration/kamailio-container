Kamailio Dockerfile
===================

This project can be used to deploy a Kamailio server inside a Docker container.

## Start

```
 docker run \
  -h node1.example.com \
  -e MY_HOSTNAME=node1.example.com \
  -e MY_IP_ADDRESS=127.0.0.1 \
  -e MY_MQ_URL=kazoo://guest:guest@127.0.0.1:5672 \
  -tid \
  -v /path/to/key.pem:/etc/kamailio/certs/key.pem:ro \
  -v /path/to/cert.pem:/etc/kamailio/certs/cert.pem:ro \
  --dns=8.8.8.8 \
  -p 5060:5060 \
  -p 5061:5061 \
  -p 7000:7000 \
  -p 7001:7001 \
  -p 5064:5064 \
  -p 5065:5065 \
  -e FREESWITCH=127.0.0.1:11000 \
  revgen/kamailio-container \
  /bin/bash
``` 

for backup sip server, `use -e FREESWITCH_BACKUP=`

