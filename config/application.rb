require_relative 'boot'

require 'rails/all'
require 'mongoid'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CrmFrequency
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Mongoid.load!(File.expand_path('mongoid.yml', './config'))

   #config.web_console.whitelisted_ips = '172.28.200.30'
    
    config.generators do |g|
    	g.orm :mongoid
    end
    config.generators do |g|
    	g.template_engine :haml
    end
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    config.time_zone = 'Europe/Moscow'
  end
end
