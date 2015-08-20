# Dockerfile
# 
# Use this command to build (assumes you have the Dockerfile in the current directory)
# sudo docker build -t iruka/caldavsrvr:latest ./

# Use Ubuntu:14.04 as the base image
FROM ubuntu:14.04

# Set the maintainer
MAINTAINER Sebastian Apel <sebastian@iruka.com>

# OK, not very dockerish, but helpful if I want to move my provisioning script to another builder (for example vagrant)
COPY . /tmp/docker
RUN cd /tmp/docker/; ./00-provision.sh
RUN rm -rf /tmp/docker


