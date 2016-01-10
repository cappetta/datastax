#!/bin/bash

source ~/venv/openstack_v1.2.0/bin/activate;
source /home/cappetta/openrc.capp


nova secgroup-delete elk
nova secgroup-delete minecraft
nova secgroup-delete jmx
nova secgroup-delete cassandra

nova secgroup-create elk "allows elk application traffic"
nova secgroup-add-rule elk tcp 5601 5601 0.0.0.0/0
nova secgroup-add-rule elk tcp 9200 9200 0.0.0.0/0
nova secgroup-add-rule elk tcp 9300 9300 0.0.0.0/0
nova secgroup-add-rule elk tcp 8080 8080 0.0.0.0/0

nova secgroup-create jmx "allows jmx application traffic"
nova secgroup-add-rule jmx tcp 7199 7199 0.0.0.0/0



nova secgroup-create minecraft "allows minecraft application traffic"
nova secgroup-add-rule minecraft tcp 25565 25565 0.0.0.0/24


nova secgroup-create cassandra "allows cassandra application traffic across entire cluster"
nova secgroup-add-rule cassandra tcp 7199 7199 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 9042 9042 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 2003 2003 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 2004 2004 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 8125 8125 0.0.0.0/0


nova secgroup-create atlassian "allows elk system traffic between nodes"
nova secgroup-add-group-rule cluster elk tcp 5601 5601 0.0.0.0/24
nova secgroup-add-group-rule cluster elk tcp 9200 9200 0.0.0.0/24
nova secgroup-add-group-rule cluster elk tcp 9300 9300 0.0.0.0/24



