
keystone tenant-create --name Cassandra --description "Cassandra Project"
keystone user-create --name cappetta --pass capp --email thomas.cappetta@gmail.com
keystone user-role-add --user cappetta --tenant Cassandra --role admin
