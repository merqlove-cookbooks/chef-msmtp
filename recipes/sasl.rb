#
# Cookbook Name:: msmtp
# Recipe:: sasl
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

sasl_pkgs = []

# We use case instead of value_for_platform_family because we need
# version specifics for RHEL.
case node['platform_family']
when 'debian'
  sasl_pkgs = %w{libsasl2-2 libsasl2-modules ca-certificates}
when 'rhel'
  if node['platform_version'].to_i < 6
    sasl_pkgs = %w{cyrus-sasl cyrus-sasl-plain openssl}
  else
    sasl_pkgs = %w{cyrus-sasl cyrus-sasl-plain ca-certificates}
  end
when 'fedora'
  sasl_pkgs = %w{cyrus-sasl cyrus-sasl-plain ca-certificates}
end

sasl_pkgs.each do |pkg|
  package pkg
end