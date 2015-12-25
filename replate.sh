#!/bin/bash

echo "Scrip for replating Glan-api.conf "

echo "Enter VIP: "
read VIP
echo "Enter Physical IP:"
read PIP

## With Keystone ##
echo "Replate into file keystone.conf"
sleep(3)

echo "Copy file keystone"
cp /etc/keystone/keystone.conf /etc/keystone/keystone.conf.bka
echo "Start replate !"

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/keystone?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/keystone?charset=utf8/g" /etc/keystone/keystone.conf

sed -i "s/rabbit_hosts = $PIP/rabbit_hosts = 10.10.10.11:5672,10.10.10.12:5672,10.10.10.13:5672/g" \
/etc/keystone/keystone.conf

echo "Done service Keystone"

## With Glance ##

echo "Replate into file glance-api.conf"
sleep(3)

cp /etc/glance/glance-api.conf /etc/glance/glance-api.conf.bka

sed -i "registry_host = $PIP/registry_host = $VIP" /etc/glance/glance-api.conf

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/glance?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/glance?charset=utf8/g" /etc/glance/glance-api.conf

sed -i "s/$PIP:/$VIP:/g" /etc/glance/glance-api.conf

sed -i "s/rabbit_hosts = $PIP/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" /etc/glance/glance-api.conf

echo "Replate into file glance-cache.conf"
sleep(3)

cp /etc/glance/glance-cache.conf /etc/glance/glance-cache.conf.bka

sed -i "s/registry_host = $PIP/registry_host = $VIP/g" /etc/glance/glance-cache.conf

sed -i "s/$PIP:/$VIP:/g" /etc/glance/glance-cache.conf

echo "Replate into file glance-registry.conf"
sleep(3)

cp /etc/glance/glance-registry.conf /etc/glance/glance-registry.conf.bka

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/glance?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/glance?charset=utf8/g" /etc/glance/glance-registry.conf

sed -i "s/$PIP:/$VIP:/g" /etc/glance/glance-registry.conf

sed -i "s/rabbit_hosts = $PIP/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" /etc/glance/glance-registry.conf

## With Nova ##

echo "Replate into file nova.conf"
sleep(3)

cp /etc/nova/nova.conf /etc/nova/nova.conf.bka

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/nova?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/nova?charset=utf8/g" /etc/nova/nova.conf

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/nova_api?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/nova_api?charset=utf8/g" /etc/nova/nova.conf

sed -i "s/$PIP:/$VIP:/g" /etc/nova/nova.conf

sed -i "s/rabbit_hosts = $PIP/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" /etc/nova/nova.conf

## With Neutron ##

echo "Replate into file neutron.conf"
sleep(3)

cp /etc/neutron/neutron.conf /etc/neutron/neutron.conf.bka

sed -i "s/connection = mysql+pymysql:\/\/root:abc123@$PIP\/neutron?charset=utf8/\
connection = mysql+pymysql:\/\/root:abc123@$VIP\/neutron?charset=utf8/g" /etc/neutron/neutron.conf

sed -i "s/$PIP:/$VIP:/g" /etc/neutron/neutron.conf

sed -i "s/rabbit_hosts = $PIP/rabbit_hosts = 10.10.10.11,10.10.10.12,10.10.10.13/g" /etc/neutron/neutron.conf

## Done !!! ##
echo "Finish replate file into forders: keystone, nova, neutron, glance !!! Continue next steps"
