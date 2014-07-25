#
# Cookbook Name:: msmtp
# Attributes:: default
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

case node['platform']
when 'smartos'
  cafile = '/opt/local/etc/postfix/cacert.crt'
when 'redhat', 'centos', 'scientific', 'oracle', 'fedora', 'amazon'
  cafile = '/etc/pki/tls/certs/ca-bundle.crt'
else
  cafile = '/etc/postfix/cacert.crt'
end

default['msmtp']['group'] = 'mail'
default['msmtp']['config'] = '/etc/msmtprc'
default['msmtp']['log'] = '/var/log/msmtp.log'
# default['msmtp']['name'] = 'localhost'
default['msmtp']['port'] = 587
default['msmtp']['host'] = node['hostname']
default['msmtp']['domain'] = node['domain']
default['msmtp']['cert'] = cafile

# default['msmtp']['credential_method'] = 'data_bag'         # or plain

default['msmtp']['root'] = true
# default['msmtp']['auth_method'] = false
# default['msmtp']['auth_username'] = false
# default['msmtp']['auth_password'] = false
# default['msmtp']['use_starttls'] = true
# default['msmtp']['use_tls'] = true
default['msmtp']['accounts'] = {}
