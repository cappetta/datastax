
# Datastax OpsCenter Role
class datastax::cassandra {
# todo: declare install script in puppet manifest.

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  exec {"Install Custom Cassandra-env.sh":
      command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-env.sh /etc/cassandra/',
  }

  exec {"Install custom_metric_collection":
    command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/custom_metrics.yaml /etc/cassandra/',
  }

}