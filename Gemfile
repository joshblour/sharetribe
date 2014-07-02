source 'http://rubygems.org'
gemspec


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', "~> 3.2.2"
  gem 'uglifier'
  gem 'asset_sync'
end

group :development, :test do
  gem 'rubocop',          require: false
end

group :development do
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',       require: false
  gem 'guard-rspec',      require: false
  gem 'zeus', '0.15.1'
end

group :test do
  gem "rspec-rails"
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
  gem 'selenium-webdriver', "~>2.41.0"
  gem 'launchy'
  gem 'ruby-prof'
  gem 'factory_girl_rails'
  gem "pickle"
  gem 'email_spec'
  gem 'action_mailer_cache_delivery'
  gem "parallel_tests", :group => :development
  gem 'timecop'
  gem 'rack-test'
  gem 'database_cleaner'
  gem 'connection_pool'
  gem 'coveralls', require: false
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-stack_explorer'
end