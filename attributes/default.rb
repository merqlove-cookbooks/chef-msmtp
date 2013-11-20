#
# Cookbook Name:: msmtp
# Attributes:: msmtp
#
# Copyright 2009, Sander van Zoest
# Copyright 2012, Mike Adolphs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['msmtp']['mailhub_name'] = 'localhost'
default['msmtp']['mailhub_port'] = 587
default['msmtp']['hostname'] = node['hostname']
default['msmtp']['rewrite_domain'] = node['domain']

default['msmtp']['from_line_override'] = true

default['msmtp']['credential_method'] = 'data_bag'         # or plain

default['msmtp']['root'] = false
default['msmtp']['auth_method'] = false
default['msmtp']['auth_username'] = false
default['msmtp']['auth_password'] = false
default['msmtp']['use_starttls'] = true
default['msmtp']['use_tls'] = true
