require 'spec_helper.rb'

describe 'Packer template should exist and validate correctly' do
	describe command '( cd ../packer; packer validate debian-7.8-amd64.json )' do
		its(:stdout) { should match /^Template validated successfully\.$/ }
	end
end

