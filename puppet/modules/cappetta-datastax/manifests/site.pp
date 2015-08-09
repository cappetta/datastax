node 'opscenter'{
#  include profiles::datastax
  include datastax::opscenter
}

# match any datastax nodes "node#" naming convention
node /^node\d+$/ {
#  include profiles::cassandra
  include datastax::casspandra
}

node default {
#  include profiles::base
}
