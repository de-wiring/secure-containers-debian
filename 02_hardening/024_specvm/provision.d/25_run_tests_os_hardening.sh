gem install --no-ri --no-rdoc rake serverspec rubocop

cd /root
git clone https://github.com/TelekomLabs/tests-os-hardening.git
cd tests-os-hardening

sed -i 's/STANDALONE_SPEC=true//g' Rakefile

TARGET_HOST= rake serverspec:default | tee /root/serverspec-hardening.out
