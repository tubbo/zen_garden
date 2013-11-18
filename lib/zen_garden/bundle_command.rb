module ZenGarden
  module BundleCommand
    def bundle_exec *commands
      commands.each { |command| sh "yes | bundle exec #{command}" }
    end
  end
end
