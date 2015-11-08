
# Datastax OpsCenter Role
class cappetta-datastax::profile_cassandra {
# todo: declare install script in puppet manifest.

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }



# cassandra has java dependency
# todo: conflicts w/ profile_jmxtrans - how to create logic to prevent error?
#  class { 'java':
#  distribution  => 'jdk',
#  notify        => Exec['fix missing packages']
#  }


# This is a simple smoke test
# of the file_line resource type.
  $packages = ['libjna-java','python-support','dsc22','cassandra=2.1.9','datastax-agent']
  file { '/etc/apt/sources.list.d/cassandra.sources.list':
    ensure => file,
    mode   => '0644',
  } ->
  file_line { 'Add DataStax Repo':
    line => 'deb http://debian.datastax.com/community stable main',
    path => '/etc/apt/sources.list.d/cassandra.sources.list',
  } -> # and then...
  exec{ "add datastax repo key":
    command => 'wget -q -O - http://debian.datastax.com/debian/repo_key | sudo apt-key add -',
  } -> # and then...
  exec{ "update repos":
    command => 'sudo apt-get update --fix-missing',
  }-> # and then
  package{
    $packages: ensure => "latest",
    require => Class['java']
  }->
  file { '/var/lib/datastax-agent/conf/address.yaml':
    ensure => file,
    mode   => '0644',
  }->
#  exec { 'remove data files':
#    command => 'rm -rf /var/lib/cassandra/data/system/*',
#  }->
  exec { 'put cassandra config file: topology.properties':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-topology.properties /etc/cassandra', }->
  exec { 'put cassandra config file: cassndra.yaml':          command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra.yaml /etc/cassandra',  }->
  exec { 'put cassandra config file: custom_metrics.yaml':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/custom_metrics.yaml /etc/cassandra',}->
  exec { 'put cassandra config file: env.sh':                 command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra-env.sh /etc/cassandra', }->
  exec{ 'download jamm-0.3.0.jar':                            command => 'wget -O /usr/share/cassandra/lib/jamm-0.3.0.jar http://central.maven.org/maven2/com/github/jbellis/jamm/0.3.0/jamm-0.3.0.jar' } ->
  file_line { 'add stomp interface':
    line    => 'stomp_interface: 192.168.0.50' ,
    path    => '/var/lib/datastax-agent/conf/address.yaml',
  }->
  exec{'restart cassandra':
    command => 'sudo service cassandra restart'
  }->
  exec{'restart datastax-agent':
    command => 'sudo service datastax-agent restart'
  }


}
