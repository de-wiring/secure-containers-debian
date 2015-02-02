require 'spec_helper.rb'

describe 'Base image should exist' do
	describe file '../../builds/debian_hardened-7.8_virtualbox/debian_hardenend-debian-7.8.box' do
		it { should be_file }
	end

	describe command 'vagrant box list' do
		its(:stdout) { should match /^de-wiring\/debian-7\.8_hardened.*virtualbox/ }
	end
end

