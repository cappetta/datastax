#node default {
#  include base
#  include user::stack
#  include user::vagrant
#  include grenade
#  include devstack
#}

include stdlib
#OPTIONS::["system", "pypy", "3", "3.3"]
# todo: MASTER::DEFECT::install doesn't work.  Analysis Reqired.
#class { 'python' :
#  version    => '3',
#  pip        => true,
#  dev        => true,
#  virtualenv => true,
#  gunicorn   => false,
#}


file { "/home/vagrant/venv/":
    ensure => absent,
    force  => true
#    notify => File['setup venv'],
  }

file { "/home/vagrant/venv/":
  ensure => "directory",
}

file { "/home/vagrant/venv/python3/":
ensure => absent,
force  => true
}

file { "/home/vagrant/venv/python2.6/":
ensure => absent,
force  => true
}


python::virtualenv { '/home/vagrant/venv' :
  ensure       => present,
  version      => 'system',
  requirements => '/vagrant/requirements.txt',
  systempkgs   => true,
  distribute   => false,
  venv_dir     => '/home/vagrant/venv/python2.7',
  owner        => 'vagrant',
  group        => 'vagrant',
  cwd          => '/home/vagrant/venv/python2.7',
  timeout      => 0
}

#
#python::virtualenv { '/home/vagrant/venv2' :
#  ensure       => present,
#  version      => '3',
#  requirements => '/vagrant/requirements.txt',
#  systempkgs   => true,
#  distribute   => false,
#  venv_dir     => '/home/vagrant/venv/python3',
#  owner        => 'vagrant',
#  group        => 'vagrant',
#  cwd          => '/home/vagrant/venv/python3',
#  timeout      => 0,
#}