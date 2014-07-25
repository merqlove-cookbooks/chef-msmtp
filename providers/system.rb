#
# Cookbook Name:: msmtp
# Provider:: system
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
  template node['msmtp']['config'] do
    source    new_resource.source
    cookbook  new_resource.cookbook
    owner     'root'
    group     'mail'
    mode      00640
    if new_resource.variables.empty?
      variables config: { system: node['msmtp'] }
    else
      variables new_resource.variables
    end
  end
  file node['msmtp']['log'] do
    owner 'root'
    group 'mail'
    mode  00660
  end
  new_resource.updated_by_last_action(true)
end

action :delete do
  file node['msmtp']['config'] do
    action :delete
  end
  new_resource.updated_by_last_action(true)
end
