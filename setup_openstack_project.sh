
keystone tenant-create --name Cassandra --description "Cassandra Project"
keystone user-create --name cappetta --pass capp --email thomas.cappetta@gmail.com
keystone user-role-add --user cappetta --tenant Cassandra --role admin

keystone tenant-create --name MineCraft --description "MineCraft Project"
keystone user-create --name minecraft --pass m1n3cr4ft_p455w0rd
keystone user-role-add --user minecraft --project_name MineCraft --role _member_
