#!/bin/bash

source ~/venv/openstack_v1.2.0/bin/activate;
source /home/cappetta/openrc.capp


nova secgroup-delete cassandra

nova secgroup-create cassandra "allows cassandra application traffic across entire cluster"
nova secgroup-add-rule cassandra tcp 7199 7199 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 9042 9042 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 2003 2003 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 2004 2004 0.0.0.0/0
nova secgroup-add-rule cassandra tcp 8125 8125 0.0.0.0/0


