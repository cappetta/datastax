node 'opscenter'{
#  include profiles::datastax
  include cappetta-datastax::opscenter
}

# match any datastax nodes "node#" naming convention
node /^agent\d+$/ {
#  include profiles::cassandra
  include cappetta-datastax::base_profile
  include cappetta-datastax::profile_cassandra
  include cappetta-datastax::profile_jmxtrans
#  include cappetta-datastax::cassandra-cappetta


}

node graphite {
#  include profiles::base
#  include cappetta-datastax::graphite
}


node default {

}