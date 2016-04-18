Kamailio Dockerfile
===================

This project can be used to deploy a Kamailio server inside a Docker container.

## Start

start revgen/rabbitmq-container with --name rabbitmq
start revgen/freeswitch-container with --name freeswitch

```
 docker run \
  -h node1.example.com \
  --link rabbitmq:rabbitmq \
  --link freeswitch:freeswitch
  -e MY_HOSTNAME=node1.example.com \
  -e MY_IP_ADDRESS=0.0.0.0 \
  -e MY_AMQP_URL=kazoo://guest:guest@rabbitmq:5672 \
  -tid \
  -v /path/to/key.pem:/etc/kamailio/certs/key.pem:ro \
  -v /path/to/cert.pem:/etc/kamailio/certs/cert.pem:ro \
  --dns=8.8.8.8 \
  -p PUBLIC_IP:5060:5060 \
  -p PUBLIC_IP:5061:5061 \
  -p PUBLIC_IP:7000:7000 \
  -p PUBLIC_IP:7001:7001 \
  -p PUBLIC_IP:5064:5064 \
  -p PUBLIC_IP:5065:5065 \
  -e FREESWITCH=freeswitch:11000 \
  --name kamailio \
  revgen/kamailio-container \
  /bin/bash
``` 

for backup sip server, `use -e FREESWITCH_BACKUP=`

