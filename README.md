## To use:
Follow the ordered :

    1. Launch the Script to bring the nodes up and then perform parallel provisioning
        a) ./up-parallel.sh

    2. Log into OpsCenter Web UI @ http://localhost:8888 or http://192.168.0.50:8888
        a. Select Manage an Existing Cluster
            - Enter IP: 192.168.0.11
        b. Wait - Verify the OpsCenter Console contains a dashboard
            displaying 2-DataCenters w/ 5 servers total.

    3. Confirm Graphite Web UI @ https://localhost:8443
        a. Accept Security Exception
        b. Browse the "Server Metrics" file on the left hand side
        c. Manually make some pretty graphs (automation of dashboard in progress)


# Overview

There were 3 goals of this project:

    1. to automate the creation of a highly available, fault-tolerant,
        big data infrastructure using Cassandra

    2. to leverage puppet to build roles & profiles automating
        the install of critical components.

    3. to leverage yaml to abstract & parametrize the configurations.

This project automates the creation of a multi-node cassandra environment across
2 virtual data centers.

The end result is 7 vms
    - an OpsCenter node
    - a Graphite Prototyping Dashboard
    - 5 Cassandra nodes w/ JMXTrans setup & actively streaming metrics to Graphite

This project leverages YAML to enable reuse of the vagrantfile.

Personally - It improves the usability when constantly tearing-down / rebuilding systems while interatcing
between host and virtual environments.

YAML integration w/ puppet is yet to happen.

This project has a published page under GitHub @ http://cappetta.github.io/datastax

Support
-------

Please create bug reports and feature requests in [GitHub issues] [2].

[2]: https://github.com/cappetta/datastax/issues


### Authors and Contributors
author: thomas cappetta
reference to be published w/ 1.0


##### Release notes:
v0.9 - currently works for only ubuntu-based boxes.  OS variations have not been coded.

