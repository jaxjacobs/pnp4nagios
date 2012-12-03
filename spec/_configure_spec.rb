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
%w{debian rhel}.each do |platform|

  describe "The pnp4nagios:_install #{platform} recipe" do
    before (:all) {
      # Create our object
      @chef_run = ChefSpec::ChefRunner.new
      @chef_run.node.automatic_attrs['hostname'] = 'localhost'
      @chef_run.node.automatic_attrs['platform'] = platform
      @chef_run.node.automatic_attrs['platform_family'] = platform
      @chef_run.node.automatic_attrs['lsb'] = { 'codename' => 'squeeze' }
      case platform
      when 'debian'
        @chef_run.node.set['apache'] = { 'dir' => '/etc/apache2' }
      when 'rhel'
        @chef_run.node.set['apache'] = { 'dir' => '/etc/httpd' }
      end
      @chef_run.converge 'pnp4nagios::_configure'
    }
    it 'it should load service definitions from pnp4nagios::_define_services' do
      @chef_run.should include_recipe 'pnp4nagios::_define_services'
    end
    it "should write file from template pnp4nagios.conf" do
      pending "not implemented yet"
    end
    case platform
    when 'debian'
      t_path = "/etc/default"
    when 'rhel'
      t_path = '/etc/sysconfig'
    end
    ["#{t_path}/npcd",
     "/etc/pnp4nagios/apache.conf",
     "/etc/pnp4nagios/process_perfdata.cfg",
     "/etc/pnp4nagios/config.php"].each do |file|
      it "should create file from template #{file}" do
        @chef_run.should create_file file
      end
    end
  end
end
