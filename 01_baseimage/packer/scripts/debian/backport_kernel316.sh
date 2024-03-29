# add wheezy-backports to apt sources, install 3.16 kernel incl. sources

echo "deb http://http.debian.net/debian wheezy-backports main" >>/etc/apt/sources.list

export DEBIAN_FRONTEND="noninteractive"
apt-get update -yqq
apt-get install -yq -t wheezy-backports linux-headers-3.16.0-0.bpo.4-all-amd64
apt-get install -yq -t wheezy-backports linux-image-amd64
apt-get -yq -t wheezy-backports install virtualbox
dpkg-reconfigure virtualbox-dkms


