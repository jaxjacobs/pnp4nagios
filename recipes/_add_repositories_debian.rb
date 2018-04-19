# Cookbook Name:: pnp4nagios
# Recipe:: _add_repositories_debian
#
# Copyright 2012, Bigpoint GmbH
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# We install the latest version from squeeze backports so we add that
apt_repository node['lsb']['codename'] + '-backports' do
    uri 'http://backports.debian.org/debian-backports'
    distribution node['lsb']['codename'] + '-backports'
    components ['main', 'non-free']
    only_if { node['lsb']['codename'] == 'squeeze' }
    action :add
end

apt_repository 'debmon-' + node['lsb']['codename'] do
    key 'http://debmon.org/debmon/repo.key'
    uri 'http://debmon.org/debmon'
    distribution 'debmon-' + node['lsb']['codename']
    components ['main', 'non-free']
    action :add
end