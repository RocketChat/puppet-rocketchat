require 'rspec-puppet-facts'
require 'puppet-syntax/tasks/puppet-syntax'

include RspecPuppetFacts

RSpec.configure do |c|
  c.mock_with :rspec
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
  c.formatter = 'documentation'
end

require 'puppetlabs_spec_helper/module_spec_helper'
