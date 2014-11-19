require 'spec_helper.rb'

describe 'Base image should exist' do
	describe command 'vagrant box list' do
		its(:stdout) { should match /^de-wiring\/debian.*virtualbox/ }
	end
end

