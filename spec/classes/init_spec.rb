require 'spec_helper'
describe 'rocket' do

  let(:facts) do
    {
      processorcount: 4,
      root_home: '/',
      osfamily: 'debian',
      operatingsystem: 'Debian',
      operatingsystemmajrelease: 8,
      puppetversion: '4,9',
      lsbdistid: 'debian',
      kernel: 'Linux',
      hardwaremodel: 'x86_64'
    }
  end

  context 'with defaults for all parameters' do
    it { should contain_class('rocket') }
  end
end
