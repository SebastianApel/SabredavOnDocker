#!/bin/bash

# Configure for fast Ubuntu mirrors
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

cat << EOF > /tmp/sources.list
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
EOF

sudo cp /tmp/sources.list /etc/apt/sources.list
sudo apt-get update -y