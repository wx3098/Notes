require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Board
  class Application < Rails::Application
    config.load_defaults 6.1
  end

  config.time_zone = 'Tokyo'
  config.active_record.:default_timezone = :local
end