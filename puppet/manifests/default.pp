

include stdlib
include cappetta-datastax


file { "/home/vagrant/venv/":
#    ensure => absent,
    force  => true,
    ensure => "directory",
#    notify => File['setup venv'],
}


file { "/home/vagrant/venv/python3/":
ensure => absent,
force  => true
}
#
#
## todo: setup mutliple python environments w/ different requirements & versions
#python::virtualenv { '/home/vagrant/venv.python2.7' :
#  ensure       => present,
#  version      => 'system',
#  requirements => '/vagrant/requirements.txt',
#  systempkgs   => true,
#  distribute   => false,
#  venv_dir     => '/home/vagrant/venv/python2.7',
#  owner        => 'vagrant',
#  group        => 'vagrant',
#  cwd          => '/home/vagrant/venv/python2.7',
#  timeout      => 0
#}

# syncronize ssh keys to allow opscenter to control the install of cassandra
# create a playbook that deploys the different config files (jmxtrans & graphite)
  # yaml of files needed for parameteriztion
# launch the stress test: start recorder, start test, stop recorder, output results.
