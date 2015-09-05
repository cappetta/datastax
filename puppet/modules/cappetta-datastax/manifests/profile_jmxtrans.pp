class cappetta-datastax::profile_jmxtrans  {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/share/jmxtrans/" ] }

  # Docnotes:  This class has a functional programming setup using Anchors (->)
  # this ensures specific pre-requisite dependencies are met.
  # currently this is tested only for ubunty setups.
  # Expanded OS support to come in future releases.

  exec {"Download JMXTrans":
      command => 'wget -O /tmp/jmxtrans.deb https://github.com/downloads/jmxtrans/jmxtrans/jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb',
      notify  => Package['Install JMXTrans']
  } ->

  package { "Install JMXTrans":
    provider => dpkg,
    ensure   => latest,
    source   => "/tmp/jmxtrans.deb",
    require  => Class['java']
  } ->

  exec {
    "Deploy JMXTrans Config":
      command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/config.etc.default.jmxtrans /etc/default/jmxtrans',
  } ->

  exec {
    "Deploy JMXTrans.yaml":
      command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/jmxtrans.yaml /usr/share/jmxtrans/tools/jmxtrans.yaml',
  } ->
  exec {"Deploy yaml2jmxtool":
    command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/yaml2jmxtrans.py /usr/share/jmxtrans/tools/yaml2jmxtrans.py',
  } ->
exec {"Create Cassandra_JMX.json from yaml":
      command => 'python ./tools/yaml2jmxtrans.py ./tools/jmxtrans.yaml',
      cwd     => '/usr/share/jmxtrans/',
  } ->

  exec{'kill jmxtrans & restart':
    command => "kill -9 $(ps -eaf | grep -i jmxtrans | grep -iv grep|awk '{print \$2}')  "
  } ->
  exec{'start jmxtrans monitoring':
    command => 'jmxtrans.sh start Cassandra_JMX.json',
    cwd     => '/usr/share/jmxtrans/'
  } ->

  file_line{'add path to .bashrc':
    line => 'export PATH="$PATH:/usr/share/jmxtrans:"',
    path => '/home/vagrant/.bashrc'
  }


}
