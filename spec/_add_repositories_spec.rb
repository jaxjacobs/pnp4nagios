# Required for proper recipe testing by platform
%w{debian rhel}.each do |platform|
  describe "The pnp4nagios::_add_repositories #{platform} recipe" do
    before (:all) {
      # Create our object
      @chef_run = ChefSpec::ChefRunner.new
      @chef_run.node.automatic_attrs['hostname'] = 'localhost'
      @chef_run.node.automatic_attrs['platform'] = platform
      @chef_run.node.automatic_attrs['platform_family'] = platform
      @chef_run.node.automatic_attrs['lsb'] = { 'codename' => 'squeeze' }
      @chef_run.converge 'pnp4nagios::_add_repositories'
      @chef_run
    }
    it 'should include platform based tasks' do
      @chef_run.should include_recipe "pnp4nagios::_add_repositories_#{platform}"
    end
  end
end
