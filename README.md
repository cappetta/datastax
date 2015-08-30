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
    3. Verify the OpsCenter Console contains a dashboard displaying 2-DataCenters w/ 3 servers in each DC.
    


    3. Confirm Graphite Web UI @ https://localhost:8443
        3a. Accept Security Exception




m1ZZ3Nc0nTr0:cassandra cappetta$ vagrant ssh agent1 -c 'cassandra-stress -d agent2,agent3,agent1 -n 100000'
Created keyspaces. Sleeping 3s for propagation.
total,interval_op_rate,interval_key_rate,latency,95th,99.9th,elapsed_time
2800,280,280,104.4,226.5,620.8,10
6861,406,406,94.5,192.1,620.8,20
13073,621,621,63.1,168.4,619.5,31
20980,790,790,52.1,144.9,562.1,41
29596,861,861,46.5,125.2,561.1,51
39118,952,952,41.8,118.0,561.1,61
50207,1108,1108,34.1,106.5,244.7,72
60802,1059,1059,27.6,102.1,621.8,82
76199,1539,1539,19.3,92.5,621.8,92
91577,1537,1537,17.0,83.9,621.8,102
100000,842,842,15.7,80.1,621.8,109


Averages from the middle 80% of values:
interval_op_rate          : 990
interval_key_rate         : 990
latency median            : 40.7
latency 95th percentile   : 122.5
latency 99.9th percentile : 541.7
Total operation time      : 00:01:49
END


Issue - JMX was not working due to small memory footprint.
Solution: reduce the max memory and reduce setup environment variables

export _JAVA_OPTIONS="-XX:ParallelGCThreads=1 -Xmx10m"
vagrant@agent1:/usr/share/jmxtrans$ java -version
Picked up _JAVA_OPTIONS: -XX:ParallelGCThreads=1 -Xmx10m
java version "1.7.0_79"
OpenJDK Runtime Environment (IcedTea 2.5.6) (7u79-2.5.6-0ubuntu1.14.04.1)
OpenJDK 64-Bit Server VM (build 24.79-b02, mixed mode)


Support
-------

Please create bug reports and feature requests in [GitHub issues] [2].

[2]: https://github.com/cappetta/datastax/issues


### Authors and Contributors
author: thomas cappetta
reference source & authors to be published w/ v1.0.


##### Release notes:
v0.9 - currently works for only ubuntu-based boxes.  OS variations have not been coded.

