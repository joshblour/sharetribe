# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

module Sharetribe
  class << self
    # Return either Application or Engine,
    # depending on how Sharetribe has been loaded
    def application
      engine? ? ::Sharetribe::Engine : ::Kassi::Application
    end

    def root
      application.root
    end

    # Are we running as an engine?
    def engine?
      defined?(Sharetribe::Engine).present?
    end

    def application?
      !engine?
    end

  end
end

# Load Sharetribe as a Rails Engine, unless running as a Rails Application
unless defined?(Kassi::Application)
  require 'sharetribe/engine'
end

require "sharetribe/version"

