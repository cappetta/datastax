class cappetta-datastax::params {
  #todo: establish a base set of parms from heira file.
  $autoupdate = hiera('datastax::params::autoupdate')
  $nodes      = hiera('datastax::params::servers')
  $env        = hiera('datastax::params::environment')

}