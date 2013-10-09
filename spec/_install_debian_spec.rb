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

require 'chefspec'

# Required for proper recipe testing by platform
%w{debian}.each do |platform|
%w{squeeze wheezy}.each do |codename|
  describe "The pnp4nagios::_install_#{platform} #{codename} recipe" do
    before (:all) {
      # Create our object
      @chef_run = ChefSpec::ChefRunner.new
      @chef_run.node.automatic_attrs['hostname'] = 'localhost'
      @chef_run.node.automatic_attrs['platform'] = platform
      @chef_run.node.automatic_attrs['platform_family'] = platform
      @chef_run.node.automatic_attrs['lsb'] = { 'codename' => codename }
      @chef_run.converge "pnp4nagios::_install_#{platform}"
      @chef_run
    }
    it 'should install pnp4nagios' do
      @chef_run.should install_package 'pnp4nagios pnp4nagios-web'
    end
  end
end
end
