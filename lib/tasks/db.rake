require 'zen_garden/database'

namespace :db do
  include ZenGarden::Database

  desc "Create the database user"
  task :user do
    sh "createuser -s #{database[:username]}"
  end

  namespace :setup do
    desc "'First-time' database setup, create and migrate in one shot"
    task :first_time => %w(db:create db:migrate)
  end
end

desc "Create the database user and database, set up the schema, and run seeds"
task :db => %w(db:user db:setup db:test:prepare)
