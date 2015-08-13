
# Datastax OpsCenter Role
class cappetta-datastax::cassandra {
# todo: declare install script in puppet manifest.

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


  # todo:  Cassandra needs to be installed before these 2 will work
  exec {"Install Custom Cassandra-env.sh":
      command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-env.sh /etc/cassandra/',
  }

  exec {"Install custom_metric_collection":
    command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/custom_metrics.yaml /etc/cassandra/',
  }

  exec { 'fix missing packages':
    command => 'sudo /usr/bin/apt-get update --fix-missing',
    notify => [
      Class['Java'],
    ]
  }

  class { 'java':
    distribution => 'jdk',
  }


}