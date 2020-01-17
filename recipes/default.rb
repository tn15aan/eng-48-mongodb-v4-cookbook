#
# Cookbook:: mongo_cookbook_new
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
# execute 'mongod_apt_key' do
#   command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927'
#   action :run
# end
#
# execute 'mongod_update_sourcelist' do
#   command 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'
#   action :run
# end

include_recipe 'apt'
# include_recipe 'debian'

execute 'mongod_apt_key'do
  command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B'
  action :run
end

execute 'mongod_update_sourcelist' do
  command "echo 'deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb.list"
  action :run
end

execute 'apt-update' do
  command 'sudo apt-get update -y'
  action :run
end

execute 'mongodb_install' do
  command 'sudo apt install mongodb-org=4.2.1 mongodb-org-server=4.2.1 mongodb-org-shell=4.2.1 mongodb-org-mongos=4.2.1 mongodb-org-tools=4.2.1'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl restart mongod'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl enable mongod'
  action :run
end
