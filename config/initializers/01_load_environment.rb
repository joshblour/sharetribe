require File.expand_path('../../config_loader', __FILE__)
APP_CONFIG = ConfigLoader.load_app_config
VENDOR_CSS_PATH = Rails.root.join("vendor", "assets", "stylesheets")

Rails.application.config.assets.paths << VENDOR_CSS_PATH
  
# Define here additional Assset Pipeline Manifests to include to precompilation
Rails.application.config.assets.precompile += ['markerclusterer.js', 'communities/custom-style-*', 'ss-*', 'modernizr.min.js', 'mercury.js','jquery-1.7.js']

# enable custom domain cookies rack middleware
Rails.application.config.middleware.use "CustomDomainCookie", APP_CONFIG.domain

if APP_CONFIG.use_recaptcha
  ENV['RECAPTCHA_PUBLIC_KEY']  = APP_CONFIG.recaptcha_public_key
  ENV['RECAPTCHA_PRIVATE_KEY'] = APP_CONFIG.recaptcha_private_key
end

Sharetribe.application.configure do

# This is the list of all possible locales. Part of the translations may be unfinished.
  config.AVAILABLE_LOCALES = [
        ["English", "en"],
        ["Suomi", "fi"],
        ["Pусский", "ru"],
        ["Nederlands", "nl"],
        ["Ελληνικά", "el"],
        ["Kiswahili", "sw"],
        ["Română", "ro"],
        ["Français", "fr"],
        ["中文", "zh"],
        ["Español", "es"],
        ["Español", "es-ES"],
        ["Catalan", "ca"],
        ["Tiếng Việt", "vi"],
        ["Deutsch", "de"],
        ["Svenska", "sv"],
        ["Italiano", "it"],
        ["Hrvatski", "hr"],
        ["Português do Brasil", "pt-BR"],

        # Customization languages
        ["English", "en-rc"],
        ["Français", "fr-rc"],
        ["Español", "es-rc"],
        ["Deutsch", "de-rc"],
        ["English UL", "en-ul"],
        ["English SB", "en-sb"],
        ["English", "en-bf"],
        ["French", "fr-bd"],
        ["English", "en-bd"],
        ["English", "en-cf"],
        ["English", "en-vg"],
        ["English", "en-bl"],
        ["Deutsch", "de-bl"],
        ["English", "en-un"],
        ["English", "en-qr"],
        ["English", "en-at"],
        ["French", "fr-at"],
  ]

  # This is the list o locales avaible for the dashboard and newly created tribes in UI
  config.AVAILABLE_DASHBOARD_LOCALES = [
        ["English", "en"],
        ["Suomi", "fi"],
        ["Español", "es"],
        ["Français", "fr"],
        ["Deutsch", "de"],
        ["Pусский", "ru"],
        ["Ελληνικά", "el"]
  ]
  
  # Configure Paperclip
  paperclip_options = {
        :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
        :url => "/system/:attachment/:id/:style/:filename"
  }

  if (APP_CONFIG.s3_bucket_name && APP_CONFIG.aws_access_key_id && APP_CONFIG.aws_secret_access_key)
    paperclip_options.merge!({
      :path => "images/:class/:attachment/:id/:style/:filename",
      :url => ":s3_domain_url",
      :storage => :s3,
      :s3_protocol => 'https',
      :s3_credentials => {
            :bucket            => APP_CONFIG.s3_bucket_name,
            :access_key_id     => APP_CONFIG.aws_access_key_id,
            :secret_access_key => APP_CONFIG.aws_secret_access_key
      }
    })
  end
  config.paperclip_defaults = paperclip_options
  
  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  config.i18n.default_locale = (APP_CONFIG.default_locale ? APP_CONFIG.default_locale.to_sym : :en)
  
end