require 'spec_helper'

describe 'rocketchat' do
  on_supported_os.each do |os, facts|
    let(:facts) do
      facts.merge( root_home: '/' )
    end

    context "with default values on #{os}" do
      context 'should compile' do
        it { is_expected.to compile.with_all_deps }
      end

      context 'should contain classes with correct params' do
        it do
          is_expected.to contain_class('rocketchat::packages').with(
            'nodejs_version' => '4',
            'nodejs_deps'    => true
           )
        end
        it do
          is_expected.to contain_class('rocketchat::database').with(
            'port'         => '27017',
            'verbose'      => 'false',
            'manage_repos' => 'true'
           )
        end

        it { is_expected.to contain_class('rocketchat::database').that_requires("Class[rocketchat::packages]") }
        it { is_expected.to contain_class('rocketchat::database').that_comes_before("Class[rocketchat::install]") }

        it do
          is_expected.to contain_class('rocketchat::install').with(
            'download_path' => '/tmp',
            'destination'   => '/opt',
            'package_ensure' => 'latest',
            'package_source' => nil
           )
        end

        it do
          is_expected.to contain_class('rocketchat::service').with(
            'port'          => '80',
            'mongo_host'    => 'localhost',
            'mongo_port'    => '27017',
            'mongo_replset' => nil,
            'authsource'    => nil,
            'database_name' => 'rocket_chat',
            'root_url'      => 'http://rocket.com',
            'destination'   => '/opt'
          )
        end

        it { is_expected.to contain_class('rocketchat::service').that_requires("Class[rocketchat::install]")}
      end
    end

    context 'with remote mongo database' do
      let(:params) do
        {
          mongo_host: 'www.mongohost.com'
        }
      end

      context 'should compile' do
        it { is_expected.to compile.with_all_deps }
      end

      context 'shouldn not contain rocketchat::database class' do
        it { is_expected.not_to contain_class('rocketchat::database') }
      end
    end
  end
end
