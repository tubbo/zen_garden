$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zen_garden/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zen_garden"
  s.version     = ZenGarden::VERSION

  s.authors     = ["Tom Scott"]
  s.email       = %w(tubbo@psychedeli.ca)
  s.homepage    = "http://github.com/tubbo/zen_garden"

  s.summary     = %{
    ZenGarden is a continuous deployment workflow for
    Rails apps. After testing your app on Travis-CI,
    it deploys your app to Heroku upon successful
    builds. ZenGarden is built with Rake tasks for
    extreme ease.
  }
  s.description = s.summary

  s.files = `git ls-files`.split "\n"
  s.test_files = s.files.grep(/\Aspec/)

  s.add_dependency "rails", '>= 3.0.0'
  s.add_dependency "rake"
  s.add_dependency "heroku"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
end
