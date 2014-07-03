require 'sharetribe/required_gems'

module Sharetribe
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/", "#{config.root}/app/models/**/*"]    
    
    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
      end
    end
    
  end
end
