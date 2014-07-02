require 'sharetribe/required_gems'
require File.expand_path('../../../config/config_loader', __FILE__)
APP_CONFIG ||= ::ConfigLoader.load_app_config

module Sharetribe
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
      end
    end
    
  end
end
