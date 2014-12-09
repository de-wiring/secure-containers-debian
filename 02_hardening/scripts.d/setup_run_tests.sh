#!/bin/bash

if [[ `id -u` != 0 ]]; then
	echo Must run as root, exiting
	exit 1
fi

cd /root
git clone -b 1.0.0 https://github.com/TelekomLabs/tests-os-hardening.git

export PATH=$PATH:/opt/chef/bin:/opt/chef/embedded/bin/
export RUBYLIB=$RUBYLIB:/opt/chef/embedded/lib

gem install --no-ri --no-rdoc rake
gem install --no-ri --no-rdoc -v '2.99.0' rspec-core
gem install --no-ri --no-rdoc -v '2.99.0' rspec-expectations
gem install --no-ri --no-rdoc -v '1.0.1' rspec-its
gem install --no-ri --no-rdoc -v '1.16.0' serverspec
gem install --no-ri --no-rdoc -v '0.27.1' rubocop

cd /root/tests-os-hardening
sed -i 's/STANDALONE_SPEC=true//g' Rakefile

TARGET_HOST= rake serverspec:default | tee /root/serverspec-hardening.out
