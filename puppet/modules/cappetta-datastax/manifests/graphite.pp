class cappetta-datastax::graphite  {

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  $packages = ['vim','curl', 'zip','unzip','git','python-pip' ]
  package{ $packages: ensure => "latest"  }

  exec {
    "Download JMXTrans ":
      command => 'wget -O /tmp/jmxtrans.deb https://github.com/downloads/jmxtrans/jmxtrans/jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb',
      notify  => Exec['Deploy JMXTrans Config']
  }


  exec {
    "Deploy JMXTrans Config":
      command => 'sudo cp /vagrant/puppet/modules/cappetta-datastax/files/config.etc.default.jmxtrans /etc/default/jmxtrans',
      notify  => Package['Install JMXTrans']
  }

  package { "Install JMXTrans":
    provider => dpkg,
    ensure   => latest,
    source   => "/tmp/jmxtrans.deb"
  }
}
