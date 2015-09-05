node 'opscenter'{
# install script handles the install
}

# match any datastax nodes "node#" naming convention
node /^agent\d+$/ {
  include cappetta-datastax::base_profile
  include cappetta-datastax::profile_cassandra
#  include cappetta-datastax::refresh_cluster
}

node graphite {
  include cappetta-datastax::base_profile
  include cappetta-datastax::profile_jmxtrans
#  include cappetta-datastax::refresh_graphite
}


node default {

}