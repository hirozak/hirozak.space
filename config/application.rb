require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hirozak
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.load_defaults 5.1

    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework false
    end

    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # # optional
    # config.autoload_paths += Dir["#{config.root}/app/validators"]
    # config.autoload_paths += Dir["#{config.root}/app/services"]
  end
end
