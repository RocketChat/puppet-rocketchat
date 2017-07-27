require 'spec_helper_acceptance'

describe 'rocketchat' do
  let(:manifest) {
    <<-EOS
      include rocketchat
    EOS
  }

  it 'should run without errors' do
    result = apply_manifest(manifest, catch_failures: true)
    expect(result.exit_code).to eq 2
  end

#  it 'should delete accounts' do
#    grants_results = shell("mysql -e 'show grants for root@127.0.0.1;'")
#    expect(grants_results.exit_code).to eq 1
#  end

# it 'should delete databases' do
#    show_result = shell("mysql -e 'show databases;'")
#    expect(show_result.stdout).not_to match /test/
#  end

# it 'should run a second time without changes' do
#    result = apply_manifest(manifest, :catch_failures => true)
#    expect(@result.exit_code).to eq 0
#  end

#  describe package('mysql-server') do
#    it { is_expected.to be_installed }
#  end
end
