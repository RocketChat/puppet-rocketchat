require 'spec_helper'

describe 'rocket' do
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
          is_expected.to contain_class('rocket::packages').with(
            'nodejs_deps' => true
           )
        end
        it do
          is_expected.to contain_class('rocket::database').with(
            'port'         => '27017',
            'verbose'      => 'false',
            'manage_repos' => 'true'
           )
        end

        it { is_expected.to contain_class('rocket::database').that_requires("Class[rocket::packages]") }
        it { is_expected.to contain_class('rocket::database').that_comes_before("Class[rocket::install]") }

        it do
          is_expected.to contain_class('rocket::install').with(
            'download_path' => '/tmp',
            'destination'   => '/opt',
            'package_ensure' => 'latest'
           )
        end

        it do
          is_expected.to contain_class('rocket::service').with(
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

        it { is_expected.to contain_class('rocket::service').that_requires("Class[rocket::install]")}
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

      context 'shouldn not contain rocket::database class' do
        it { is_expected.not_to contain_class('rocket::database') }
      end
    end
  end
end
