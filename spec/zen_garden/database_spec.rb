require 'spec_helper'
require 'zen_garden/database'

module ZenGarden
  describe Database do
    class MockTask; include ZenGarden::Database; end

    subject { MockTask.new }

    let(:yaml) { subject.database }

    %i(config_path full_yaml env_specific_yaml).each do |reader|
      let(reader) { subject.send reader }
    end

    it "produces a hash with the database credentials" do
      expect(yaml).to be_a ActiveSupport::HashWithIndifferentAccess
      expect(yaml[:database]).to eq('db/test.sqlite3')
    end

    it "knows where the configuration is stored" do
      expect(config_path).to match(/database\.yml/)
    end

    it "gets all yaml as a hash in full" do
      expect(full_yaml).to be_a Hash
      expect(full_yaml).to have_key('test')
    end

    it "scopes down based on rails environment" do
      expect(env_specific_yaml).to be_a Hash
      expect(env_specific_yaml).to have_key('adapter')
    end
  end
end
