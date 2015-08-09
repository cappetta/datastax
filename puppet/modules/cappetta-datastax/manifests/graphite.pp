class datastax::graphite  {

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  $packages = ['vim','curl', 'zip','unzip','git','python-pip','openjdk-7-jdk' ]
  package{ $packages: ensure => "latest"  }

  file {
    'my_bash_script':
      ensure => 'file',
      source => 'puppet:///modules/cappetta-datastax/graphite.install.sh',
      path => '/tmp/graphite.install.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744', # Use 0700 if it is sensitive
      notify => Exec['Install Graphite'],
  }

  exec {
    'Install Graphite':
      command => '/tmp/graphite.install.sh',
      refreshonly => true,
  }

  file {
    'etc_hosts':
      ensure => 'file',
      source => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
      path => '/etc/hosts',
      owner => 'root',
      group => 'root',
      mode  => '0744',
  }
}


#############################################
## @author: cappetta
## @purpose: setup the /etc/hosts file for the cluster
#############################################
class cluster {
# hiera lookup IP set to variable to share w/ template
  $cluser_ip_prefix = "%{{C_Class_Addr}}"

  file { '/tmp/hosts':
    content => template('cluster/etc.hosts.erb'),
    owner   => root,
    group   => root,
    mode    => 644,
  }




}