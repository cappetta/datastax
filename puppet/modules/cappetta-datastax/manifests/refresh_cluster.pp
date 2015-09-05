class cappetta-datastax::refresh_cluster{
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  exec { 'put cassandra config file: topology.properties':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-topology.properties /etc/cassandra', refreshonly => true,}->
  exec { 'put cassandra config file: cassndra.yaml':          command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra.yaml /etc/cassandra', refreshonly => true, }->
  exec { 'put cassandra config file: custom_metrics.yaml':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/custom_metrics.yaml /etc/cassandra', refreshonly => true,}->
  exec { 'put cassandra config file: env.sh':                 command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-env.sh /etc/cassandra', refreshonly => true,}->
  file_line { 'add stomp interface':
    line    => 'stomp_interface: 192.168.0.50' ,
    path    => '/var/lib/datastax-agent/conf/address.yaml',
  }->
  file {
    'update etc-hosts if needed':
      ensure  => 'file',
      source  => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
      path    => '/etc/hosts',
      owner   => 'root',
      group   => 'root',
      mode    => '0744', # Use 0700 if it is sensitive
  #      notify  => Exec['Install JQ'],
  } ->
  exec{'restart cassandra':
    command => 'sudo service cassandra restart'
  }->
  exec{'restart datastax-agent':
    command => 'sudo service datastax-agent restart'
  }
}