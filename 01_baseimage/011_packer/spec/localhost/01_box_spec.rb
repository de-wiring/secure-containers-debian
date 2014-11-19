require 'spec_helper.rb'

describe 'VirtualBox 4.X should be installed' do
	describe command 'VBoxManage --version' do
		its(:stdout) { should match /^4\.[0-9]+/ }
		its(:exit_status) { should eq 0 }
	end
end

describe 'Vagrant 1.X should be installed' do
	describe command 'vagrant --version' do
		its(:stdout) { should match /^Vagrant 1\.[0-9]+/ }
		its(:exit_status) { should eq 0 }
	end
end


