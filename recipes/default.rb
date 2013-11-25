# Cookbook Name:: pnp4nagios
# Recipe:: _install
#
# Copyright 2012, Bigpoint GmbH
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

case "#{node['platform']}"
when 'ubuntu'
    include_recipe "pnp4nagios::_install_ubuntu"
    include_recipe 'pnp4nagios::_configure'
else
    include_recipe 'pnp4nagios::_dependencies'
    include_recipe "pnp4nagios::_add_repositories_#{node['platform_family']}"
    include_recipe "pnp4nagios::_install_#{node['platform_family']}"
    include_recipe 'pnp4nagios::_configure'
end
