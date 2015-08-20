#!/bin/bash

DockerRoot=/opt/dockercaldav

# init data directories
sudo mkdir -p $DockerRoot/data   
sudo cp dav/sabredav/data/db.sqlite $DockerRoot/data
sudo chown -R www-data $DockerRoot/data
sudo chmod a+rwx $DockerRoot/data/*
sudo mkdir -p $DockerRoot/logs

# run docker container
sudo docker run -it -p 5000:80 \
   -v $DockerRoot/data:/var/www/html/sabredav/data \
   -v $DockerRoot/logs:/var/log/apache2 \
   --entrypoint=/bin/bash iruka/caldavsrvr:latest

   