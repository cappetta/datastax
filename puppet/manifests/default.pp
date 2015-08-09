#node default {
#  include base
#  include user::stack
#  include user::vagrant
#  include grenade
#  include devstack
#}


 class { 'python' :
    version    => '2.6',
    pip        => true,
    dev        => true,
    virtualenv => true,
    gunicorn   => false,
  }

file { "/home/vagrant/venv":
    ensure => "directory"
  }


  python::virtualenv { '/home/vagrant/venv' :
    ensure       => present,
    version      => '2.6',
    requirements => '/vagrant/requirements.txt',
    systempkgs   => true,
    distribute   => false,
    venv_dir     => '/home/vagrant/venv/python2.6',
    owner        => 'vagrant',
    group        => 'vagrant',
    cwd          => '/home/vagrant/venv/python2.6',
    timeout      => 0,
  }