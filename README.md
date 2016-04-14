Kamailio Dockerfile
===================

This project can be used to deploy a Kamailio server inside a Docker container.

## Node specific post install configuration
add cert.pem & key.pem to /etc/kamailio/certs

start with specified hostname (use -h flag when starting docker) `docker run -h test.example.com`