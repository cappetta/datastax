node 'opscenter'{
#  include profiles::datastax
  include cappetta-datastax::opscenter
}

# match any datastax nodes "node#" naming convention
node /^agent\d+$/ {
#  include profiles::cassandra
  include cappetta-datastax::base_profile
  include cappetta-datastax::profile_cassandra

}

node graphite {
#  include profiles::base
  include cappetta-datastax::graphite
  include cappetta-datastax::profile_jmxtrans
}


node default {

}