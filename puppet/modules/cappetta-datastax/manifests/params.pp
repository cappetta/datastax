class cappetta-datastax::params {
  #todo: establish a base set of parms from heira file.
  $autoupdate = hiera('datastax::params::autoupdate')
  $nodes      = hiera('datastax::params::servers')
  $env        = hiera('datastax::params::environment')
  $env        = hiera('cassandra.metricsReporterConfigFile=/etc/cassandra/jmxtrans.cassandra.yaml') # profile_cassandra yaml

  #profile_jxmtrams
  command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/config.etc.default.jmxtrans /etc/default/jmxtrans',
command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/jmx/jmxtrans.yaml /usr/share/jmxtrans/tools/jmxtrans.yaml',
command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/jmx/yaml2jmxtrans.py /usr/share/jmxtrans/tools/yaml2jmxtrans.py',
#profile_cassandra
exec { 'put cassandra config file: topology.properties':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra-topology.properties /etc/cassandra', }->
exec { 'put cassandra config file: cassndra.yaml':          command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra.yaml /etc/cassandra',  }->
exec { 'put cassandra config file: custom_metrics.yaml':    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra/jmxtrans.cassandra.yaml /etc/cassandra',}->
exec { 'put cassandra config file: env.sh':                 command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/cassandra/cassandra-env.sh /etc/cassandra', }->
#refresh_graphite
#refresh_cluster as well...


exec { "refresh JMXTrans.yaml":  command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/jmxtrans.yaml /usr/share/jmxtrans/tools/jmxtrans.yaml', refreshonly => true,} ->
}