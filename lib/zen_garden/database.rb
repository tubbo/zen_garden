require 'yaml'

# Code for loading database configuration.

module ZenGarden
  module Database
    def database
      env_specific_yaml.with_indifferent_access
    end

    private
    def config_path
      "#{Rails.root}/config/database.yml"
    end

    def full_yaml
      YAML::load_file config_path
    end

    def env_specific_yaml
      full_yaml[rails_env]
    end

    def rails_env
      ENV['RAILS_ENV'] || 'development'
    end
  end
end
