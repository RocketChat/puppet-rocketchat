require 'beaker-rspec'

# Install Puppet on all hosts
install_puppet_agent_on(hosts, options)

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      install_dev_puppet_module_on(
        host,
        source:  module_root,
        module_name: 'rocketchat',
        target_module_path:  '/etc/puppetlabs/code/environments/production/modules')
      # Install dependencies
      on(host, puppet('module', 'install', 'puppetlabs-stdlib'))
      on(host, puppet('module', 'install', '--version', "'>=4.0.1'", 'puppet-nodejs'))
      on(host, puppet('module', 'install', 'puppetlabs-apt'))
      on(host, puppet('module', 'install', 'puppetlabs-mongodb'))
      on(host, puppet('module', 'install', 'maestrodev-wget'))
      on(host, puppet('module', 'install', 'puppet-archive'))

      # Add more setup code as needed
    end
  end
end
