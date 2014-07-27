#
# Cookbook Name:: msmtp
# Resource:: accounts
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

actions        :create
default_action :create

attribute :name,             kind_of: String, name_attribute: true
attribute :cookbook,         kind_of: String, default: 'msmtp'
attribute :source,           kind_of: String, default: 'msmtprc.erb'
attribute :variables,        kind_of: Hash,   default: {}