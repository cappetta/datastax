
# Datastax OpsCenter Role
class datastax::base_profile {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  $packages = ['vim','curl', 'zip','unzip','git','python-pip','openjdk-7-jdk' ]
  package{ $packages: ensure => "latest"  }


  file {
    '/etc/hosts':
      ensure  => 'file',
      source  => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
      path    => '/etc/hosts',
      owner   => 'root',
      group   => 'root',
      mode    => '0744', # Use 0700 if it is sensitive
      notify  => Exec['Install OpsCenter'],
  }


  exec {
    "Install JQ ":
      command => 'wget -O /usr/bin/jq http://stedolan.github.io/jq/download/linux64/jq',
      refreshonly => true
  }

  exec {
    "Install JMXTrans ":
      command => 'wget -O /tmp/jmxtrans.deb https://github.com/downloads/jmxtrans/jmxtrans/jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb',
      refreshonly => true
  }


}

