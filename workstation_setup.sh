start em1 @ startup: http://unix.stackexchange.com/questions/36705/why-the-default-eth0-interface-is-down-by-default-on-centos
[root@workstation ~(keystone_demo)]# systemctl | grep -i openstack | grep -i fail

[root@workstation ~(keystone_demo)]# for service in $(systemctl|grep -i openstack|awk '{print $1}'); do echo "systemctl start $service"; done;
systemctl start neutron-dhcp-agent.service
systemctl start neutron-l3-agent.service
systemctl start neutron-metadata-agent.service
systemctl start neutron-openvswitch-agent.service
systemctl start neutron-ovs-cleanup.service
systemctl start neutron-server.service
systemctl start openstack-ceilometer-alarm-evaluator.service
systemctl start openstack-ceilometer-alarm-notifier.service
systemctl start openstack-ceilometer-api.service
systemctl start openstack-ceilometer-central.service
systemctl start openstack-ceilometer-collector.service
systemctl start openstack-ceilometer-compute.service
systemctl start openstack-ceilometer-notification.service
systemctl start openstack-cinder-api.service
systemctl start openstack-cinder-backup.service
systemctl start openstack-cinder-scheduler.service
systemctl start openstack-cinder-volume.service
systemctl start openstack-glance-api.service
systemctl start openstack-glance-registry.service
systemctl start openstack-keystone.service
systemctl start openstack-losetup.service
systemctl start openstack-nova-api.service
systemctl start openstack-nova-cert.service
systemctl start openstack-nova-compute.service
systemctl start openstack-nova-conductor.service
systemctl start openstack-nova-consoleauth.service
systemctl start openstack-nova-novncproxy.service
systemctl start openstack-nova-scheduler.service
systemctl start openstack-swift-account-auditor.service
systemctl start openstack-swift-account-reaper.service
systemctl start openstack-swift-account-replicator.service
systemctl start openstack-swift-account.service
systemctl start openstack-swift-container-auditor.service
systemctl start openstack-swift-container-replicator.service
systemctl start openstack-swift-container-updater.service
systemctl start openstack-swift-container.service
systemctl start openstack-swift-object-auditor.service
systemctl start openstack-swift-object-replicator.service
systemctl start openstack-swift-object-updater.service
systemctl start openstack-swift-object.service
systemctl start openstack-swift-proxy.service


Things to automate:
    install centos-7, ubuntu images
    increase storage/block size


# FACTS:

    wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
    wget http://cloud-images.ubuntu.com/trusty/20151105/trusty-server-cloudimg-amd64-disk1.img
    glance image-create --name "centos-7" --disk-format qcow2 --container-format bare --file CentOS-7-x86_64-GenericCloud-1503.qcow2 --min-disk 10 --min-ram 2048

    wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
    wget http://cloud-images.ubuntu.com/trusty/20151105/trusty-server-cloudimg-amd64-disk1.img
    glance image-create --name "centos-7" --disk-format qcow2 --container-format bare --file CentOS-7-x86_64-GenericCloud-1503.qcow2 --min-disk 10 --min-ram 2048

    qemu-img info trusty-server-cloudimg-amd64-disk1.img
# ref - changing types but not needed because img = qcow2
#    qemu-img convert -f raw -O qcow2 /home/cappetta/trusty-server-cloudimg-amd64-disk1.img /home/cappetta/ubuntu.trusty.qcow2

    #todo: TIP::: get image info:  qemu-img info trusty-server-cloudimg-amd64-disk1.img
    glance image-create --name "ubuntu/trusty64" --disk-format qcow2 --container-format bare --file /home/cappetta/ubuntu.trusty.qcow2 --min-disk 10 --min-ram 2048



    wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-i386.ova
    glance image-create --name "trusty32" --disk-format qcow2 --container-format ova --file trusty-server-cloudimg-i386.ova --min-disk 10 --min-ram 2048



## Defects
### ----------------
    # http://dpaste.com/yours
    glance image-create --name "centos-7" --disk-format qcow2 --container-format bare --is-public true --copy-from http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1503.qcow2 --min-disk 10 --min-ram 2048 --checksum e324e3ab1d24a1bbf035ddb365e7f9058c0b454acf48d7aa15c5519fae5998ab
### ----------------

Install Tempest / Rally / Cleanup Scripts
    https://raw.githubusercontent.com/openstack/kloudbuster/master/kloudbuster/force_cleanup.sh
    http://www.tech-thoughts-blog.com/2013/08/licstart-following-is-entire-license.html

Install vagrant
    sudo yum install -y https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.rpm


This broke me : https://tickets.puppetlabs.com/browse/PUP-2940
    pain in ass to resolve:
        for rpm in $(rpm -qa | egrep -i "ruby|puppet|bundle|vagrant" ); do sudo yum -y erase $rpm; done
        sudo rm -rf /usr/local/bin/vagrant
        sudo yum install -y https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.rpm
        vagrant plugin install vagrant-openstack-plugin
        look into rvm usage venv for ruby

        misc notes:
            - cleanup gems http://stackoverflow.com/questions/5902488/uninstall-old-versions-of-ruby-gems
            -  setup openstack puppet modules and run packstack individually:
                - update puppet hiera:
                - update puppet hieradata:
                        /etc/puppet/hieradata
                -


todo:
Expand Storage: http://docs.openstack.org/juno/install-guide/install/yum/content/cinder-install-storage-node.html
configure internal dhcp & flowing ip: https://www.rdoproject.org/Neutron_with_existing_external_network


delete your machines via api then remove the cached data from your local .vagrant -- https://github.com/ggiamarchi/vagrant-openstack-provider/issues/195



reference links:
https://github.com/marafa/openstack.git
https://github.com/ggiamarchi/vagrant-openstack-provider
https://github.com/puppetlabs/puppetlabs-openstack


https://www.rdoproject.org/Neutron_with_existing_external_network
https://www.rdoproject.org/forum/discussion/577/howto-packstack-allinone-install-with-neutron-and-external-connectivity/p1
https://www.rdoproject.org/Neutron_with_existing_external_network
https://www.mirantis.com/blog/configuring-floating-ip-addresses-networking-openstack-public-private-clouds/
https://www.rdoproject.org/Neutron_with_existing_external_network
http://blog.scottlowe.org/2015/09/28/using-vagrant-with-openstack/
http://docs.openstack.org/openstack-ops/content/flavors.html
http://vancluevertech.com/tag/openvswitch/




vagrant up agent1 --no-provision; vagrant provision --provision-with shell agent1 ; vagrant provision --provision-with puppet agent1
ps -eaf | grep -i ruby | grep -iv "grep"| awk '{print $2}'| xargs -I"PID" sh -c 'kill -9 PID'