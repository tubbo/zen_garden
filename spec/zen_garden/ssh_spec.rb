require 'spec_helper'
require 'zen_garden/ssh'


module ZenGarden
  describe SSH do
    class MockTask; include ZenGarden::SSH; end
    subject { MockTask.new }

    let(:ssh_config) { subject.send :ssh_config  }
    let(:test_file_path) { "/tmp/test_ssh_config" }

    context "with a mocked config" do
      before do
        subject.stub(:ssh_config_path) { test_file_path }
      end

      let(:file_contents) { IO.read "/tmp/test_ssh_config" }

      it "writes the ssh config" do
        expect(subject.write_ssh_config).to eq(122)
        expect(file_contents).to eq(ssh_config)
      end

      it "knows if the ssh config already exists" do
        expect(system("touch #{test_file_path}")).to be_true
        expect(subject.ssh_config_exists?).to be_true
      end

      after { system "rm -f /tmp/test_ssh_config" }
    end

    it "defines what goes inside the ssh config" do
      expect(ssh_config).to match(/Host heroku\.com/)
    end

    it "finds the ssh config path" do
      expect(subject.send(:ssh_config_path)).to match(/\.ssh\/config/)
    end
  end
end
