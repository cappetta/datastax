# Overview

This project creates and Stress-tests a multi-node cassandra environment w/ a Graphite Reporting Dashboard.

This project has a published page under GitHub which is still under draft: http://cappetta.github.io/datastax.

## Order of Execution:
1) ./up







## To use:
First, Execute the following commands

    1. Launch the Script to bring the nodes up and then perform parallel provisioning
        a) ./up-provision.sh
    2. Log into OpsCenter Web UI @ http://localhost:8888
        2a. Register Cassandra Clients:
            - Default user/pass: vagrant/vagrant
            - Enter IPs of Clients:
                192.168.0.10
                192.168.0.11
                192.168.0.12
                192.168.0.13
            -

    3. Log into Graphite Web UI @ https://localhost:8443

Then confirm the Graphite Server is up & accept the trust exception. @ http://localhost:8443
    if url is not working perform: vagrant reload graphite

After confirming Graphite is working navigate to DataStax Ops Center @ http://localhost:8888
Enter the following information:
    Version: DataStax Community 2.1.8
    IPs:
        123


## useful commands:
sudo puppet apply --modulepath=./modules/ ./manifests/default.pp

vagrant ssh opscenter -c 'ps -eaf | grep -i opscenter'



### github pages

Read more at https://help.github.com/pages.


### Welcome to Cassandra

There were 3 goals of this project:

One was to automate the creation of a small scale highly available, fault-tolerant, big data infrastructure.
Two was to leverage puppet to perform an stress test and automate the generation of results.
Three was to leverage yaml to abstract & parametrize the configurations.

### Creating pages manually
If you prefer to not use the automatic generator, push a branch named `gh-pages` to your repository to create a page manually. In addition to supporting regular HTML content, GitHub Pages support Jekyll, a simple, blog aware static site generator. Jekyll makes it easy to create site-wide headers and footers without having to copy them across every page. It also offers intelligent blog support and other advanced templating features.

### Authors and Contributors
author: thomas cappetta
reference authors to be published w/ v1.0

### Support or Contact
Having trouble with Pages? Check out our [documentation](https://help.github.com/pages) or [contact support](https://github.com/contact) and we’ll help you sort it out.
