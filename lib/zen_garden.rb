require "zen_garden/engine"
require "zen_garden/ssh"
require "zen_garden/database"

module ZenGarden
  # The app name as defined by $HEROKU_APP_NAME in your shell.
  def self.app_name
    ENV['HEROKU_APP_NAME']
  end
end
