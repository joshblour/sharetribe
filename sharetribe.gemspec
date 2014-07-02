$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sharetribe/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sharetribe"
  s.version     = Sharetribe::VERSION
  s.authors     = ["Sharetribe"]
  s.email       = ["info@sharetribe.com"]
  s.homepage    = "https://github.com/sharetribe/sharetribe"
  s.summary     = "Sharetribe is a peer-to-peer marketplace platform built with Ruby on Rails."
  s.description = "Sharetribe is a platform for setting up your own peer-to-peer marketplace online. It's a Ruby on Rails based marketplace CMS. There's also a possibility to set up a hosted marketplace at https://www.sharetribe.com."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "3.2.17'"

  s.add_development_dependency "sqlite3"
  
  ruby '2.1.1'

  s.add_dependency 'rails', '3.2.17'

  # To use debugger
  #gem 'ruby-debug'

  s.add_dependency 'sass-rails'
  s.add_dependency 'compass-rails'

  s.add_dependency 'jquery-rails', '2.1.4'

  # Bundle the extra gems:

  # gem 'heroku' install the Heroku toolbelt (https://toolbelt.heroku.com/) instead (as gem had some problems)
  #gem 'thin'
  s.add_dependency 'unicorn', "~>4.6.3"

  s.add_dependency "mysql2"
  s.add_dependency 'haml'
  s.add_dependency 'sass', "  ~> 3.2.9"
  s.add_dependency 'rest-client', '>= 1.6.0'
  s.add_dependency 'acts-as-taggable-on'
  s.add_dependency 'paperclip'
  s.add_dependency 'delayed_paperclip'
  s.add_dependency 'aws-sdk'
  s.add_dependency "will_paginate"
  s.add_dependency 'dalli'
  s.add_dependency "memcachier"
  s.add_dependency 'kgio', "~>2.8.0"
  s.add_dependency 'thinking-sphinx', '~> 3.1.1'
  s.add_dependency 'flying-sphinx', "~>1.2.0"
  # Use patched v2.0.2
  # Fixes issues: Create a new delayed delta job if there is an existing delta job which has failed
  s.add_dependency 'ts-delayed-delta', "~>2.0.2"
  
  s.add_dependency 'possibly', '~> 0.1.1'
  s.add_dependency 'recaptcha'
  s.add_dependency 'delayed_job', "~>3.0.5"
  s.add_dependency 'delayed_job_active_record'
  s.add_dependency 'json', "~>1.8.0"
  s.add_dependency 'multi_json', "~>1.7.3" # 1.8.0 caused "invalid byte sequence in UTF-8" at heroku
  s.add_dependency 'russian'
  s.add_dependency 'web_translate_it'
  s.add_dependency 'postmark-rails' # could be removed as not currently used
  s.add_dependency 'rails-i18n'
  s.add_dependency 'devise', "~>2.2.4"  #3.0rc requires bit bigger changes
  s.add_dependency "devise-encryptable"
  s.add_dependency "omniauth-facebook"
  s.add_dependency 'spreadsheet'
  s.add_dependency 'rabl'
  s.add_dependency 'rake'
  s.add_dependency 'xpath'
  s.add_dependency 'dynamic_form'
  s.add_dependency "truncate_html"
  s.add_dependency 'money-rails'
  s.add_dependency 'mercury-rails'
  s.add_dependency 'fb-channel-file'
  s.add_dependency 'country_select'
  s.add_dependency 'localized_country_select', '>= 0.9.3'
  s.add_dependency 'mangopay'
  s.add_dependency 'braintree'
  s.add_dependency "mail_view", "~> 1.0.3"
  s.add_dependency 'statesman', '~> 0.5.0'

  #ouisharelabs
  s.add_dependency 'rdf-turtle'

  s.add_dependency "airbrake", "~>3.1.12"
  s.add_dependency 'newrelic_rpm', "~>3.6.2.96"

  s.add_development_dependency 'rubocop'

  s.add_development_dependency 'guard-livereload'
  s.add_development_dependency 'rack-livereload'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'zeus', '0.15.1'


  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'pry-stack_explorer'

  s.add_dependency 'strong_parameters'
  
end
