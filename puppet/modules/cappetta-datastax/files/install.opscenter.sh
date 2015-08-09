#!/bin/bash

# set timezone      todo: - convert to standard module, inventory, and parameters
echo "#{CFG_TZ}" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

#{deb_cache_cmds}

# add DataStax repo for APT
echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.community.list
wget -q -O - http://debian.datastax.com/debian/repo_key | sudo apt-key add -
apt-get update

# install OpsCenter and a few base packages
apt-get install vim curl zip unzip git python-pip opscenter -y

# start OpsCenter
service opscenterd start

echo "Vagrant provisioning complete and OpsCenter started"