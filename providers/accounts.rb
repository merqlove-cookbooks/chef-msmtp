#
# Cookbook Name:: msmtp
# Provider:: accounts
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

action :create do
  node['msmtp']['accounts'].each do |user, config|
    template "/home/#{user}/.msmtprc" do
      source   new_resource.source
      cookbook new_resource.cookbook
      owner     user
      group     node['msmtp']['group']
      mode      00600
      if new_resource.variables.empty?
        variables config: config
      else
        variables new_resource.variables
      end
    end
  end
  new_resource.updated_by_last_action(true)
end
