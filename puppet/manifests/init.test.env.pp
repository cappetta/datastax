include stdlib

# todo: Need to implement roles & profiles
include cappetta-datastax::graphite
#include cappetta-datastax::cassandra


Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'fix missing packages':
   command => 'sudo /usr/bin/apt-get update --fix-missing',
   notify => [
     Class['Java'],
    ]
}

class { 'java':
  distribution => 'jdk',
}

exec { 'updating etc.hosts':
  command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/config.etc.hosts /etc/hosts'
}

exec { 'adding shared private key to vagrant user':
  command => 'cat /vagrant/puppet/modules/cappetta-datastax/files/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys'
}


#todo:  Complete assertion test to validate, never assume.  Something to build on...
#todo: ASSERT::1 - Services are up and running