#
# Cookbook:: mongod
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#node['mongodb']['4.03']
#include_recipe 'sc-mongodb'

include_recipe 'apt'

# include_recipe  'yum'
# include_recipe 'sc-mongodb'


# Adds the repository to the soruce list and the key to trustedkeys.gpg (gpg keyring)
apt_repository 'mongodb-org' do
  uri 'http://repo.mongodb.org/apt/ubuntu'
  components ['multiverse']
  distribution 'bionic/mongodb-org/4.2'
  key '4B7C549A058F8B6B'
  action :add
  deb_src true
end

# command to reload the local package database
apt_update 'update_sources' do
  action :update
end

# Installs mongodb
package 'mongodb-org' do
  options '--allow-unauthenticated'
  action :install
end

template '/etc/mongod.conf' do
  source 'mongod.conf.erb'
  variables bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
  port: node['mongodb']['config']['mongod']['net']['port']
  notifies :restart, 'service[mongod]'
end
#resource link
template "/lib/systemd/system/mongod.service" do
 source "mongod.service.erb"
  notifies :restart, 'service[mongod]'
end

# # starts mongodb service
# service 'mongod' do
#   action :start
# end
