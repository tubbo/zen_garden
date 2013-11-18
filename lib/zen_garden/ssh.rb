
# Code for managing SSH configuration.

module ZenGarden
  module SSH
    # Writes the contents of an SSH config to Travis-CI's VM.
    def write_ssh_config
      File.write(ssh_config_path, 'rw+') do |f|
        f.puts ssh_config
      end
    end

    # Checks whether ~/.ssh/config already exists, in which case we will
    # not overwrite it.
    def ssh_config_exists?
      File.exists? ssh_config_path
    end

    private
    def ssh_config
      @ssh_config ||= %(
      Host heroku.com
        StrictHostKeyChecking no
        CheckHostIP no
        UserKnownHostsFile=/dev/null
      )
    end

    def ssh_config_path
      @config_path ||= File.expand_path "~/.ssh/config"
    end
  end
end
