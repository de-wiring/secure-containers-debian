#

apt-get update -yqq
apt-get install -y git=1:1.7.10.4-1+wheezy1

cd /root
mkdir os-hardening
cd os-hardening/
#git clone --branch v1.1.2 https://github.com/TelekomLabs/chef-os-hardening
git clone --branch v1.2.0 https://github.com/TelekomLabs/chef-os-hardening

mkdir cookbooks
mv chef-os-hardening cookbooks/os-hardening

cd cookbooks/
git clone --branch v0.6.0 https://github.com/onehealth-cookbooks/sysctl
git clone --branch v2.3.10 https://github.com/opscode-cookbooks/apt.git
git clone --branch v3.2.2 https://github.com/opscode-cookbooks/yum.git
git clone --branch v2.0.1 https://github.com/opscode-cookbooks/ohai.git

cd ..

cat <<EOF >solo.rb
root = File.absolute_path(File.dirname(__FILE__))

file_cache_path root
cookbook_path root + '/cookbooks'
EOF

cat <<EOF >solo.json
{
    "security" : {"suid_sgid": {
        "remove_from_unkown" : true
        }
    },
    "run_list":[
        "recipe[os-hardening]"
    ]
}
EOF

chef-solo -c solo.rb -j solo.json -l debug | tee /root/chef-hardening.out 

# TODO: uninstall stuff afterwards

# done.

