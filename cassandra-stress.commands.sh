#!/usr/bin/env bash

# http://stackoverflow.com/questions/29329868/cassandra-stress-failed-to-connect-over-jmx-not-collecting-these-stats

cassandra-stress user     profile=./cqlstress-example.yaml ops\(insert=1\)     n=100000     -log file=./stress_write.log     -node node1,node2,node3
cassandra-stress user     profile=/etc/cassandra/conf/cassandra_stress.yaml ops\(insert=1\)     n=10000     -log file=./stress_write.log     -node agent1


sudo java -jar jython-installer-2.7.0.jar -s -d /opt/jython -t all

JMXTrans Setup:
    - Get JMXTrans
    - sudo wget -O /tmp/jmxtrans.zip https://github.com/jmxtrans/jmxtrans/archive/master.zip

    - http://central.maven.org/maven2/org/jmxtrans/jmxtrans/250/
    - wget -O jmxtrans-all.jar http://central.maven.org/maven2/org/jmxtrans/jmxtrans/250/jmxtrans-250-all.jar


#todo: not working
# 8/27/15 - command baseline
#vagrant ssh agent1 -c 'cassandra-stress -d agent2,agent3,agent1 -n 100000'
#cassandra-stress user     profile=/vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra_stress.yaml ops\(insert=1\)     n=10000     -log file=/tmp/stress_write.log     -node agent1,agent5

#works
cassandra write
    # iterates through a set of tests that validate max threading/writing capabilities.