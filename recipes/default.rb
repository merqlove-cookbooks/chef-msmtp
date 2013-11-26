#
# Cookbook Name:: msmtp
# Recipe:: default
#
# Copyright (C) 2013 Alexander Merkulov
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "msmtp" do
  action :upgrade
end

# case node['msmtp']['credential_method']
# when 'data_bag'
#   data_bag = Chef::EncryptedDataBagItem.load('mail', 'msmtp')
#   username = data_bag['username']
#   password = data_bag['password']
# when 'plain'
#   username = node['msmtp']['auth_username']
#   password = node['msmtp']['auth_password']
# end

# template "/etc/msmtp/msmtp.conf" do
#   source "msmtp.conf.erb"
#   owner "root"
#   group "mail"
#   mode  0640
#   variables(
#     # :auth_username    => username,
#     # :auth_password    => password,
#     :accounts => )
# end

system_config
accounts
