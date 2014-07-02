require 'haml'
require 'sass'
require 'rest-client'
require 'acts-as-taggable-on'
require 'paperclip'
require 'delayed_paperclip'
require 'aws-sdk'
require "will_paginate"
require 'dalli'
require "memcachier"
require 'kgio'
require 'thinking-sphinx'
require 'flying-sphinx'
# Use patched v2.0.2
# Fixes issues: Create a new delayed delta job if there is an existing delta job which has failed
require 'ts-delayed-delta'

require 'possibly'
require 'recaptcha'
require 'delayed_job'
require 'delayed_job_active_record'
require 'json'
require 'multi_json' # 1.8.0 caused "invalid byte sequence in UTF-8" at heroku
require 'russian'
require 'web_translate_it'
require 'postmark-rails' # could be removed as not currently used
require 'rails-i18n'
require 'devise'  #3.0rc requires bit bigger changes
require "devise-encryptable"
require "omniauth-facebook"
require 'spreadsheet'
require 'rabl'
require 'rake'
require 'xpath'
require 'dynamic_form'
require "truncate_html"
require 'money-rails'
require 'mercury-rails'
require 'fb-channel-file'
require 'country_select'
require 'localized_country_select'
require 'mangopay'
require 'braintree'
require "mail_view"
require 'statesman'

#ouisharelabs
require "rdf/turtle"

require "airbrake"
require 'newrelic_rpm'

require 'strong_parameters'