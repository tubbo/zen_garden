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
    RSpec::Core::RakeTask.new :spec

    task_order = if defined? Teaspoon
      %w(db:migrate spec teaspoon)
    else
      %w(db:migrate spec)
    end

    desc "Run all tests"
    task :test => task_order

  rescue LoadError; end
end
