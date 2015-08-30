
# Datastax OpsCenter Role
class cappetta-datastax::base_profile {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  $packages = ['vim','curl', 'zip','unzip','git','python-pip', ]

  exec { 'fix missing packages':
    command => 'sudo /usr/bin/apt-get update --fix-missing',
    } -> # and then....
      package{ $packages: ensure => "latest"}

  file {
    '/etc/hosts':
      ensure  => 'file',
      source  => 'puppet:///modules/cappetta-datastax/config.etc.hosts',
      path    => '/etc/hosts',
      owner   => 'root',
      group   => 'root',
      mode    => '0744', # Use 0700 if it is sensitive
#      notify  => Exec['Install JQ'],
  }

  exec {
    "Install JQ":
      command => 'wget -O /usr/bin/jq http://stedolan.github.io/jq/download/linux64/jq',
      refreshonly => true
  }

# cassandra has java dependency
# todo: conflicts w/ profile_jmxtrans - how to create logic to prevent error?
  class { 'java':
    distribution  => 'jdk',
    notify        => Exec['fix missing packages']
  }


}

