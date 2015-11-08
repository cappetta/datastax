#!/bin/bash

sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install -y python2.6 python2.6-dev
wget https://bootstrap.pypa.io/get-pip.py

sudo /usr/bin/python2.6 get-pip.py

sudo /usr/local/bin/pip2.6 install pyyaml

sudo ln -s /vagrant/puppet/cappetta-datastax/files/jmxtrans.yaml /usr/share/jmxtrans/jmxtrans.yaml

cd /usr/share/jmxtrans && python2.6  ./tools/yaml2jmxtrans.py ./tools/jmxtrans.yaml