include stdlib
include cappetta-datastax::graphite

#file{'/home/vagrant/.ssh/authorized_keys':
#  ensure => exists
#  template =>
#}
#
#file {
#  '/home/vagrant/.ssh/authorized_keys':
#    ensure  => 'file',
#    source  => '/vagrant/id_rsa.pub',
#    path    => '/home/vagrant/.ssh/',
#    owner   => 'vagrant',
#    group   => 'vagrant',
#    mode    => '0600', # Use 0700 if it is sensitive
#}

#exec { 'Install shared public key':
#  commnad => 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDontbPo54Cz6Y5UDCwJbO2guhU8eGDtvtSPuykK/LIpY69eH7xc0EBkjRMbhQHsC8M4XLkbjx0BpXmW2JfqIiMRJ8XsCC1pe0Z8nAx8Pf57z5ZL8YgqOag01HWyOiYvVg/vsLLxsF5CUWwINEqXTiEwMmHFCxdKxtn+PMYF8MiOMDPNCr0sZkOdssSLG/IbZxXeeCZFDseN2HwGvi+roP9DPqpM5jQ5GNFgAxKSokb45lGxgczdK1BXjtriMGoF36mMYEtIhsd02VYAhldxWOuiQrIaD0mOQu/fdOu071RCNdaiKcBLlUniS1YizHEtsWrZabAMNa+ftuVIuzOyQ05" >> ~/.ssh/authorized_keys'
#}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'fix missing packages':
   command => 'sudo /usr/bin/apt-get update --fix-missing',
   notify => [
     Class['Java'],
    ]
}

class { 'java':
  distribution => 'jdk',
}

exec { 'updating etc.hosts':
  command => 'cp /vagrant/puppet/modules/cappetta-datastax/files/config.etc.hosts /etc/hosts'
}

exec { 'adding shared private key to vagrant user':
  command => 'cat /vagrant/puppet/modules/cappetta-datastax/files/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys'
}
