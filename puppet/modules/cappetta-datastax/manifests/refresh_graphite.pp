class cappetta-datastax::refresh_graphite{
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/",'/usr/share/jmxtrans/','/usr/share/jmxtrans/tools/' ] }

  exec { "refresh yaml2jmxtool":   command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/yaml2jmxtrans.py /usr/share/jmxtrans/tools/', refreshonly => true,} ->
  exec { "refresh JMXTrans.yaml":  command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/jmxtrans.yaml /usr/share/jmxtrans/tools/jmxtrans.yaml', refreshonly => true,} ->
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
  exec{'change ownership: /usr/local/jmxtrans':
    command => 'chown -R vagrant:vagrant /usr/share/jmxtrans ',
    refreshonly => true,
  } ->
  exec{'kill jmxtrans ':
    command => "kill -9 $(ps -eaf | grep -i jmxtrans | grep -iv grep|awk '{print \$2}')  "
  } ->
  exec{'create Cassandra_JMX file':
    command => 'python /usr/share/jmxtrans/tools/yaml2jmxtrans.py /usr/share/jmxtrans/tools/jmxtrans.yaml',
    cwd     => '/usr/share/jmxtrans/tools' #todo: does cwd work???
  }
  exec{'start jmxtrans monitoring':
    command => 'jmxtrans.sh start /usr/share/jmxtrans/tools/Cassandra_JMX.json',
    cwd     => '/usr/share/jmxtrans' #todo: does cwd work???
  }



}