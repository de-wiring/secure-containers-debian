#!/bin/sh

set -e
set -x

date | sudo tee /etc/vagrant_box_build_time


mkdir ~vagrant/.ssh
wget --no-check-certificate \
	'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
	-O ~vagrant/.ssh/authorized_keys
chown -R vagrant ~vagrant/.ssh
chmod -R go-rwsx ~vagrant/.ssh

