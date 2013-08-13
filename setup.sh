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
git clone http://github.com/CiscoSystems/puppet-galera -b grizzly_wip
rm -rf /usr/share/puppet/modules/galera
mkdir /usr/share/puppet/modules/galera
cp -r /opt/puppet-galera/* /usr/share/puppet/modules/galera


rm -rf /opt/puppet-keepalived
git clone http://github.com/CiscoSystems/puppet-keepalived
rm -rf /usr/share/puppet/modules/keepalived
mkdir /usr/share/puppet/modules/keepalived
cp -r /opt/puppet-keepalived/* /usr/share/puppet/modules/keepalived


rm -rf /opt/puppet-openstack-ha
git clone http://github.com/CiscoSystems/puppet-openstack-ha
rm -rf /usr/share/puppet/modules/openstack-ha
mkdir /usr/share/puppet/modules/openstack-ha
cp -r /opt/puppet-openstack-ha/* /usr/share/puppet/modules/openstack-ha

#cherry picked patches
rm -rf /opt/puppet-keystone
rm -rf /usr/share/puppet/modules/keystone
mkdir /usr/share/puppet/modules/keystone
git clone http://github.com/stackforge/puppet-keystone -b stable/grizzly
cd /opt/puppet-keystone
git fetch https://review.openstack.org/stackforge/puppet-keystone refs/changes/05/39205/3 && git cherry-pick FETCH_HEAD
cd /opt
cp -r /opt/puppet-keystone/* /usr/share/puppet/modules/keystone



rm -rf /opt/puppet-openstack
rm -rf /usr/share/puppet/modules/openstack
mkdir /usr/share/puppet/modules/openstack
git clone http://github.com/stackforge/puppet-openstack -b stable/grizzly
cd /opt/puppet-openstack
git fetch https://review.openstack.org/stackforge/puppet-openstack refs/changes/31/39831/2 && git cherry-pick FETCH_HEAD
git fetch https://review.openstack.org/stackforge/puppet-openstack refs/changes/87/40287/1 && git cherry-pick FETCH_HEAD
cd /opt
cp -r /opt/puppet-openstack/* /usr/share/puppet/modules/openstack

cp /opt/openstack-working-ha/bin/* /usr/sbin


