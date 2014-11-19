require 'spec_helper.rb'

describe 'Packer should be installed' do
	describe command 'packer --version' do
		its(:stdout) { should match /^Packer v0.7/ }
	end
end

