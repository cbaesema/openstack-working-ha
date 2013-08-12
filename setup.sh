#!/bin/bash
echo "running setup"

cd /opt

rm -rf /usr/share/puppet
mkdir /usr/share/puppet
mkdir /usr/share/puppet/modules


#pull any repo's I want by default add as needed
rm -rf /opt/grizzly-manifests
git clone http://github.com/CiscoSystems/grizzly-manifests -b g-ha-wip
cp /opt/grizzly-manifests/manifests/* /etc/puppet/manifests
cp /opt/grizzly-manifests/templates/* /etc/puppet/templates

rm -rf /opt/puppet-augeas
git clone http://github.com/camptocamp/puppet-augeas
rm -rf /usr/share/puppet/modules/augeas
mkdir /usr/share/puppet/modules/augeas
cp -r /opt/puppet-augeas/* /usr/share/puppet/modules/augeas

rm -rf /opt/puppet-galera
git clone http://github.com/danehans/puppet-galera
rm -rf /usr/share/puppet/modules/galera
mkdir /usr/share/puppet/modules/galera
cp -r /opt/puppet-galera/* /usr/share/puppet/modules/galera


rm -rf /opt/puppet-keepalived
git clone http://github.com/CiscoSystems/puppet-keepalived
rm -rf /usr/share/puppet/modules/keepalived
mkdir /usr/share/puppet/modules/keepalived
cp -r /opt/puppet-keepalived/* /usr/share/puppet/modules/keepalived


rm -rf /opt/puppet-openstack-ha
git clone http://github.com/danehans/puppet-openstack-ha
rm -rf /usr/share/puppet/modules/openstack-ha
mkdir /usr/share/puppet/modules/openstack-ha
cp -r /opt/puppet-openstack-ha/* /usr/share/puppet/modules/openstack-ha

cp /opt/openstack-working-ha/modules.list /etc/puppet/manifests

cp /opt/openstack-working-ha/bin/* /usr/sbin



