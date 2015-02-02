require 'spec_helper.rb'

describe kernel_module('vboxguest') do
	it { should be_loaded }
end
describe kernel_module('vboxsf') do
	it { should be_loaded }
end

describe linux_kernel_parameter('kernel.osrelease') do
	its(:value) { should match '3\.16' }
end

describe file '/etc/debian_version' do
	it { should be_file }
	it { should contain('7.8') }
end

describe 'it should have chef installed' do
	describe file '/usr/bin/chef-solo' do
		it { should be_file }
		it { should be_executable }
	end
	describe command 'chef-solo -v' do
		its(:stdout) { should match /^Chef: 12\.0\.3$/ }
	end
end
