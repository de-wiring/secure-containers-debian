require 'spec_helper.rb'

describe 'Base image should exist' do
	describe file '../builds/virtualbox/dewiring-debian-7.8.0-amd64-virtualbox.box' do
		it { should be_file }
	end

	describe command 'vagrant box list' do
		its(:stdout) { should match /^de-wiring\/debian.*virtualbox/ }
	end
end

