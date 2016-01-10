#!/bin/sh

# Vagrant Cassandra Project
# Brian Cantoni
#
# Provisioning several VMs at once can be pretty slow depending on the speed of
# the Ubuntu mirrors at the time. This script creates the 3 VMs in series, then
# provisions them in parallel.
#
# Try running this script instead of "vagrant up" when creating the VMs for the
# first time.
#
# source:
# http://joemiller.me/2012/04/26/speeding-up-vagrant-with-parallel-provisioning/
 
MAX_PROCS=4
 
parallel_shell_provision() {
    while read box; do
        echo "Shell Provisioning '$box'. Output will be in: $box.out.txt" 1>&2
        echo $box
    done | xargs -P $MAX_PROCS -I"BOXNAME" \
        sh -c 'vagrant provision --provision-with shell BOXNAME > /tmp/BOXNAME.out.txt 2>&1 || echo "Error Occurred: BOXNAME"' 
        #sh -c 'vagrant provision --provision-with puppet BOXNAME > /tmp/BOXNAME.out.txt 2>&1 || echo "Error Occurred: BOXNAME"'
}


parallel_puppet_provision() {
    while read box; do
        echo "Puppet Provisioning '$box'. Output will be in: $box.out.txt" 1>&2
        echo $box
    done | xargs -P $MAX_PROCS -I"BOXNAME" \
        sh -c 'vagrant provision --provision-with puppet BOXNAME >> /tmp/BOXNAME.out.txt 2>&1 || echo "Error Occurred: BOXNAME"' 
}

agents="agent1 agent2 agent3 opscenter"

## -- main -- ##
#
## start boxes sequentially to avoid vbox explosions
vagrant destroy -f $agents
vagrant up --no-provision --provider=openstack $agents

# but run provision tasks in parallel
cat <<EOF | parallel_shell_provision
agent1
agent2
agent3
opscenter
EOF
#graphite
#grafana
#
cat <<EOF | parallel_puppet_provision
agent1
agent2
agent3
opscenter
EOF


