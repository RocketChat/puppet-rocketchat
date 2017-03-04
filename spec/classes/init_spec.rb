require 'spec_helper'

describe 'rocket' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge( { root_home: '/' } )
      end

      context 'with defaults for all parameters' do
        it { should compile }
      end
    end
  end
end
