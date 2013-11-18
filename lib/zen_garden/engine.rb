require 'rails/engine'

# Hook ZenGarden directly into Rails a:d isolate its namespace.

module ZenGarden
  class Engine < ::Rails::Engine
    isolate_namespace ZenGarden
  end
end
