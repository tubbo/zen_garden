require 'zen_garden/env_file'

namespace :test do
  desc "Encrypt credentials for the testing environment on CI"
  task :credentials => :environment do
    project = ENV['TRAVIS_PROJECT_NAME']
    env = ZenGarden::EnvFile.new "#{Rails.root}/.env"

    env.exports do |key,value|
      sh "travis encrypt #{project} '#{key}=#{value}'"
    end
  end

end

unless defined? Rails::TestUnitRailtie
  begin
    require 'rspec/core/rake_task'

    if defined? Teaspoon
      RSpec::Core::RakeTask.new :spec

      desc "Run RSpec and Teaspoon code examples"
      task :test => %w(spec teaspoon)
    else
      RSpec::Core::RakeTask.new :test
    end
  rescue LoadError; end
end
