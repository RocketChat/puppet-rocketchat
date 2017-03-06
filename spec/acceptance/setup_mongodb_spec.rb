require 'spec_helper_acceptance'

describe 'rocket::database' do
  let(:manifest) {
    <<-EOS
     class { 'rocket::database':
      port => 27017,
      verbose => true,
      manage_repos => true,
}

   EOS
  }

    context 'with all default value' do
      it 'should run without errors' do
        result = apply_manifest(manifest, :catch_failures => true)
        expect(result.exit_code).to eq 2
      end
    end
end
