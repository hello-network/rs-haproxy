require_relative 'spec_helper'

describe 'rs-haproxy::collectd' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['rightscale']['instance_uuid'] = 'abcd1234'
    end.converge(described_recipe)
  end

  context 'installing collectd and setting up haproxy plugin' do
    it 'installs chef_rewind' do
      expect(chef_run).to install_chef_gem('chef-rewind')
    end

    it 'includes collectd default recipe' do
      expect(chef_run).to include_recipe('collectd::default')
    end

    it 'installs socat package' do
      expect(chef_run).to install_package('socat')
    end

    it 'Put the haproxy collectd plugin script into the collectd lib directory' do
      expect(chef_run).to create_cookbook_file("#{chef_run.node['collectd']['plugin_dir']}/haproxy")
      expect(chef_run).to create_cookbook_file('/usr/share/collectd/haproxy.db')
    end
  end
end
