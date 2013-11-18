require 'zen_garden/database'

namespace :db do
  include ZenGarden::Database

  desc "Create the database user"
  task :user do
    sh "createuser -s #{database[:username]}"
  end
end

desc "Create the database user and database, set up the schema, and run seeds"
task :db => %w(db:user db:setup)
