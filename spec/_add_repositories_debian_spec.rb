# Required for proper recipe testing by platform
%w{debian}.each do |platform|
%w{squeeze wheezy}.each do |codename|
  describe "The pnp4nagios::_add_repositories_#{platform} recipe" do
    before (:all) {
      # Create our object
      @chef_run = ChefSpec::ChefRunner.new
      @chef_run.node.automatic_attrs['hostname'] = 'localhost'
      @chef_run.node.automatic_attrs['platform'] = platform
      @chef_run.node.automatic_attrs['platform_family'] = platform
      @chef_run.node.automatic_attrs['lsb'] = { 'codename' => codename }
      @chef_run.converge "pnp4nagios::_add_repositories_#{platform}"
      @chef_run
    }
    it 'should add backports repository' do
      pending 'Not being checked since LWRP is used'
    end
  end
end
end
