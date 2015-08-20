#!/bin/bash

#
#   Purpose: Set up Apache / PHP / SQLite / sabredav
#
#

#echo on (helps to debug)
set -x 

# Setup the Ubuntu in a way it uses the closest mirror (improves speed)
source SetupUbuntuMirrors.sh

# Make sure Ubuntu is up to date - Upgrade packages
sudo apt-get upgrade -y 

################################
#### base package install 

# Install Apache
sudo apt-get install -y apache2

# installing the php5 
sudo apt-get install -y php5  php5-json php5-sqlite curl  php5-cli

# install sqlite
sudo apt-get install -y sqlite3

################################
#### Install sabre/dav

DocumentRoot=/var/www/html

# make directories
sudo mkdir $DocumentRoot/sabredav
sudo chmod a+rwx $DocumentRoot/sabredav
cd $DocumentRoot/sabredav

# install composer
curl -sS https://getcomposer.org/installer | php

# install SabreDav
php composer.phar self-update
php composer.phar require sabre/dav ~3.0.3
php composer.phar update sabre/dav

