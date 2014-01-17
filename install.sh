#!/bin/bash

#+------------------------------------------------------------------+
#| This file is used to complete installations for StuyCS machines. |
#+------------------------------------------------------------------+

echo "I need super user access"
sudo su

echo "Alright then. Making the new home directory and provisioning proper permissions for the service account."
mkdir /service
chown service /service
chgrp service /service

echo "Setting the new home directory permanently."
usermod -d /service service

echo "I need to update aptitude in order to install openssh-server and ubuntu-desktop."
apt-get update -y
echo "Update done. Installing now."
apt-get install -yopenssh-server ubuntu-desktop

echo "I am going to start preparing the machine for NIS"
echo "Remember to configure the NIS domain as stuycs"
apt-get install -y nis portmap

echo "Deleting old version of /etc/nsswitch.conf and replacing it with the version we want - its easier this way."
rm -rf /etc/nsswitch.conf
curl -o /etc/nsswitch.conf 149.89.17.90/install/cs-nfs/nsswitch.conf

echo "Doing the same thing with yp.conf and configuring it for cs-nfs."
rm -rf /etc/yp.conf
curl -o /etc/yp.conf 149.89.17.90/install/cs-nfs/yp.conf

echo "Doing the same thing with /etc/hosts.allow and configuring it for cs-nfs."
rm -rf /etc/hosts.allow
curl -o /etc/hosts.allow 149.89.17.90/install/cs-nfs/hosts.allow

echo "Working on autofs."
apt-get install -y autofs
rm -rf /etc/auto.master
curl -o /etc/auto.master 149.89.17.90/install/cs-nfs/auto.master
rm -rf /etc/auto.home
curl -o /etc/auto.home 149.89.17.90/install/cs-nfs/auto.home

echo "Working on lightdm.conf"
rm -rf /etc/lightdm/lightdm.conf
curl -o /etc/lightdm/lightdm.conf 149.89.17.90/install/cs-nfs/lightdm.conf

echo "Downloading stuypackages for the debian package manager"
cd /tmp/
curl -O 149.89.17.90/install/cs-nfs/stuypackages_1-2_all.deb
curl -O 149.89.17.90/install/cs-nfs/package_list.txt

cat /tmp/package_list.txt | xargs sudo apt-get install -y --force-yes

apt-get upgrade -y

echo "Done!"
echo ""
echo "Now shut me down as I am ready for deployment!"
echo "Thank you for using Eugene Lee's wonderful install script!"
