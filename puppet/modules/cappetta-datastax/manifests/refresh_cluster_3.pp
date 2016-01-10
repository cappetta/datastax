class cappetta-datastax::refresh_cluster_3{
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  $refresh = false
  exec { 'refresh cassandra config file: topology.properties':
    command => 'cp -f /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra-topology.properties /etc/cassandra/conf/',
    refreshonly => $refresh,
  }->

  exec { 'refresh cassandra config file: cassndra.yaml':
    command => 'cp -f /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra.yaml /etc/cassandra/conf/',
    refreshonly => $refresh,
  }->

  exec { 'refresh cassandra config file: custom_metrics.yaml':
    command => 'cp -f /vagrant/puppet/modules/cappetta-datastax/files/jmx/jmxtrans.cassandra.yaml /etc/cassandra/conf/',
    refreshonly => $refresh,
  }->

  exec { 'refresh cassandra config file: env.sh':
    command => 'cp -f /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra-env.sh /etc/cassandra/conf/',
    refreshonly => $refresh,
  }->

  exec { 'refresh cassandra config file: cassandra-stress.yaml':
    command => 'cp -f /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra_stress.yaml /etc/cassandra/conf/',
    refreshonly => $refresh,
  }->



  # todo: deprecated == remove
#  exec { 'refresh -- download & install jars - jna-platform ':
#    command => 'wget https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna-platform/4.2.1/jna-platform-4.2.1.jar -O /usr/share/cassandra/lib/jna-platform-4.2.1.jar',
#    refreshonly => $refresh,
#  }->
#
#  exec { 'refresh -- download & install jars - jna ':
#    command => 'wget https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/4.2.1/jna-4.2.1.jar -O /usr/share/cassandra/lib/jna-4.2.1.jar',
#    refreshonly => $refresh,
#  }->
#
#  exec { 'refresh -- download & install jars - metrics ':
#    command => 'wget http://central.maven.org/maven2/com/codahale/metrics/metrics-graphite/3.0.2/metrics-graphite-3.0.2.jar -O /usr/share/cassandra/lib/metrics-graphite-3.0.2.jar',
#    refreshonly => $refresh,
#  }->

#  file_line { 'refresh -- add stomp interface':
#    line    => 'stomp_interface: 192.168.1.190' ,
#    path    => '/var/lib/datastax-agent/conf/address.yaml',
#  }->

#  file {
#    'refresh etc-hosts if needed':
#      ensure  => 'file',
#      source  => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
#      path    => '/etc/hosts',
#      owner   => 'root',
#      group   => 'root',
#      mode    => '0744', # Use 0700 if it is sensitive
#  #      notify  => Exec['Install JQ'],
#  } ->

  exec{'refresh - restart cassandra':
    command => 'sudo service cassandra restart'
  }->

  exec{'refresh - restart datastax-agent':
    command => 'sudo service datastax-agent restart'
  }
}