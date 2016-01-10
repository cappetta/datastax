
# Datastax OpsCenter Role
class cappetta-datastax::profile_cassandra_3 {

  class { 'cassandra::datastax_repo':
    before => Class['cassandra']
  }

  class { 'cassandra::java':
    before => Class['cassandra']
  }

  class { 'cassandra':
    cluster_name    => 'Cassandra',
    endpoint_snitch => 'PropertyFileSnitch',
    listen_address  => "${::ipaddress}",
    seeds           => '192.168.1.151,192.168.1.152',
    num_tokens      => 256,
    auto_bootstrap  => false
  }

  class{ 'cassandra::datastax_agent':
    stomp_interface => '192.168.1.190',
  }




}


# add visualvm
# https://java.net/projects/visualvm/downloads/download/release138/visualvm_138.zip