require 'spec_helper.rb'

describe 'Base image should exist' do
	describe file '../builds/virtualbox/dewiring_debian-7.8.box' do
		it { should be_file }
	end

	describe command 'vagrant box list' do
		its(:stdout) { should match /^de-wiring\/debian.*virtualbox/ }
	end
end

