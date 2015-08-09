# Overview

This project creates and Stress-tests a multi-node cassandra environment w/ a Graphite Reporting Dashboard.

This project has a published page under GitHub which is still under draft: http://cappetta.github.io/datastax.


## To use:
First, Execute the following commands

    1. Launch the Script to bring the nodes up and then perform parallel provisioning
        a) ./up-provision.sh
    2. vagrant provision --provision-with puppet agent1 

Then confirm the Graphite Server is up & accept the trust exception. @ http://localhost:8443
    if url is not working perform: vagrant reload graphite

After confirming Graphite is working navigate to DataStax Ops Center @ http://localhost:8888
Enter the following information:
    Version: DataStax Community 2.1.8
    IPs:
        123


## useful commands:
sudo puppet apply --modulepath=./modules/ ./manifests/default.pp


### github pages

Read more at https://help.github.com/pages.