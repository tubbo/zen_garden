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

  begin
    require 'rspec/core/rake_task'
    require 'teaspoon'

    desc "Run Ruby code examples"
    RSpec::Core::RakeTask.new :application

    desc "Run JavaScript code examples"
    task :javascripts => %w(teaspoon)
  rescue LoadError; end
end

desc "Run all Ruby and JavaScript code examples"
task :test => %w(test:application test:javascripts)
