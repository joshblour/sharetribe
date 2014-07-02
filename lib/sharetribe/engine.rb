require 'sharetribe/required_gems'
require File.expand_path('../../../config/config_loader', __FILE__)
APP_CONFIG ||= ::ConfigLoader.load_app_config

module Sharetribe
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
