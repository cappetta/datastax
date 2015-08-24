# Overview

There were 3 goals of this project:

    1. to automate the creation of a highly available, fault-tolerant, big data infrastructure using Cassandra
    2. to leverage puppet to build roles & profiles automating the install of critical components.
    3. to leverage yaml to abstract & parametrize the configurations.


This project automates the creation of a multi-node cassandra environment across 2 virtual data centers.

The scripts create an OpsCenter node, a Graphite Prototyping Dashboard, and 3 Cassandra nodes w/ JMXTrans installed to monitor the state of the java virtual machines.

This project leverages YAML for vagrant robustness yet YAML has not been incorporated yet into the puppet manifests.


This project has a published page under GitHub @ http://cappetta.github.io/datastax




## To use:
First, Execute the following commands

    1. Launch the Script to bring the nodes up and then perform parallel provisioning
        a) ./up-provision.sh

    2. Log into OpsCenter Web UI @ http://localhost:8888
        2a. Register Cassandra Clients:
            - Select Manage an Existing Cluster
            - Enter IP: 192.168.0.11


    3. Confirm Graphite Web UI @ https://localhost:8443
        3a. Accept Security Exception





Support
-------

Please create bug reports and feature requests in [GitHub issues] [2].

[2]: https://github.com/cappetta/datastax/issues


### Authors and Contributors
author: thomas cappetta
reference source & authors to be published w/ v1.0.


##### Release notes:
v0.9 - currently works for only ubuntu-based boxes.  OS variations have not been coded.

