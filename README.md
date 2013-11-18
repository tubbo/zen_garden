# Zen Garden

A Rails plugin that adds a few extra Rake tasks for describing common
workflows with Postgres, Heroku, Travis and Rails. It allows you to use
Travis as part of your continous deployment workflow.

## Features

- **rake deploy** deploys your app to Heroku and if you have Airbrake
  installed, also notifies it of the deploy.
- **rake db** uses database.yml to figure out your username, then
  creates a username and sets up the database with your schema.

## Usage

You can use these Rake tasks manually, but they were designed for a
continuous development workflow using Travis-CI. So that's probably
their best use. Run `rails g travis:configuration` to get a .travis.yml
that runs them all!

## Contributing

Contributions can be made in Git or Github pull requests. You must
include tests.
