#
# Cookbook Name:: msmtp
# Recipe:: source
#
# Copyright (C) 2015 Alexander Merkulov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file "#{Chef::Config[:file_cache_path]}/#{node['msmtp']['source_file']}" do
  source   node['msmtp']['url']
  checksum node['msmtp']['checksum']
  action   :create
  notifies :run, 'bash[compile_msmtp_from_source]', :immediately
end

bash 'compile_msmtp_from_source' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -xvf #{node['msmtp']['source_file']}
    cd msmtp-#{node['msmtp']['version']}
    ./configure; make; make install
  EOH
  environment 'PREFIX' => node['msmtp']['prefix']
  action :nothing
end
