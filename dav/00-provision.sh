#!/bin/bash

#
#   Purpose: Set up Apache / PHP / SQLite / sabredav
#
#

set -x #echo on

pwd

SRCDIR=/tmp/dockerdav

DocumentRoot=/var/www/html
cd $DocumentRoot/sabredav

#  Create required directories
mkdir data
mkdir public
sudo chmod a+rwx data public

# setting up carddav

# copy apache2 configuration from provisioner
sudo cp $SRCDIR/apache2/apache2.conf /etc/apache2

# copy data 
cp $SRCDIR/sabredav/data/db.sqlite data/db.sqlite
sudo chmod -Rv a+rw data/

cp  $SRCDIR/sabredav/calendarserver.php calendarserver.php

# ----------------------------------

# set up "well-known" redirect

mkdir $DocumentRoot/.well-known

cat <<EOF > /tmp/htaccess
Redirect /.well-known/caldav /sabredav/calendarserver.php/
EOF

sudo mkdir $DocumentRoot/.well-known
sudo cp /tmp/htaccess $DocumentRoot/.well-known/.htaccess
sudo touch $DocumentRoot/.well-known/index.html

sudo chown -R www-data $DocumentRoot



