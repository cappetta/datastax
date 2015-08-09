# == Class: datastax
#
# Full description of class datastax here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'datastax':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class datastax (

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

)
# ## block moves up into datastax class - inherit is the added immediately after the closing brackets
# inherit the values from the params class # todo: confirm there is a better way to inherit configuration values e.g. YAML?
#  $autoupdate = $datastax::params::autoupdate

#inherits datastax::params {
#
#  validate_bool($autoupdate)
#
#}

