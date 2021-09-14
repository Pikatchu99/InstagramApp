require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module InstagramApp
  class Application < Rails::Application
    config.exceptions_app = self.routes
    config.load_defaults 5.2
    config.time_zone = 'West Central Africa'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
