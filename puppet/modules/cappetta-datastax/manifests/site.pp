node 'opscenter'{
#  include profiles::datastax
  include cappetta-datastax::opscenter
}

# match any datastax nodes "node#" naming convention
node /^agent\d+$/ {
#  include profiles::cassandra
  include cappetta-datastax::cassandra
}

node graphite {
#  include profiles::base
  include cappetta-datastax::graphite
}


node default {

}