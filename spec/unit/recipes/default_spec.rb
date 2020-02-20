#
# Cookbook:: mongod
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'
require 'chefspec/policyfile'
#require 'chefspec/metadata'


describe 'mongod::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
end
   it 'should check if source list exists' do
     allow(File).to receive(:exist?)
     .with('/etc/apt/sources.list.d/')
     .and_return(true)
   end
   it 'should check if mongodb exists' do
     allow(File).to receive(:exist?)
     .with('/etc/apt/sources.list.d/mongodb-org-3.2.list')
     .and_return(true)
   end
    # describe file('/etc/apt/sources.list.d/') do
    #   its('content') {should match('mongodb-org')}
    #   .and_return(true)
    # end
   it 'should install apt from a recipe' do
     expect(chef_run).to include_recipe 'apt'
   end

   it 'should install yum from a recipe' do
     expect(chef_run).to include_recipe 'yum'
   end

   # it 'should installpython from a recipe' do
   #   expect(chef_run).to include_recipe 'poise-python'
   # end

   it 'should install mongodb from a recipe' do
     expect(chef_run).to include_recipe 'sc-mongodb'
   end

   it 'enables mongod service' do
     expect(chef_run).to enable_service "mongod"
   end

   it 'starts mongod service' do
     expect(chef_run).to start_service "mongod"
   end
end

#   context 'When all attributes are default, on CentOS 7' do
#     # for a complete list of available platforms and versions see:
#     # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
#     platform 'centos', '7'
#
#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#   end
# end
