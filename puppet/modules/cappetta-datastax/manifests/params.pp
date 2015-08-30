class cappetta-datastax::params {

  $autoupdate = hiera('datastax::params::autoupdate')
  $nodes      = hiera('datastax::params::servers')
  $env        = hiera('datastax::params::environment')

}