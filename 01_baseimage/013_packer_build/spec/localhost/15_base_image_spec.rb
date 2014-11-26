require 'spec_helper.rb'

describe 'Base image should exist' do
	describe file '../builds/virtualbox/debian_debian-7.7_chef-latest.box' do
		it { should be_file }
	end

	describe command 'vagrant box list' do
		its(:stdout) { should match /^de-wiring\/debian.*virtualbox/ }
	end
end

