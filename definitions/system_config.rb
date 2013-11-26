#
# Cookbook Name:: msmtp
# Definition:: system_config
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

define :system_config do
  template node["msmtp"]["config"] do
    source "msmtprc.erb"
    owner "root"
    group "mail"
    mode  0640
    variables(:config => {:system => node["msmtp"]})
  end
  file node["msmtp"]["log"] do
    owner "root"
    group "mail"
    mode  0660
  end
end
