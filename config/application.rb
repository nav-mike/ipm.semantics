require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SemanticCmsDemo
  # Application settings class
  class Application < Rails::Application
    config.time_zone = 'Moscow'
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Config gem
    Bundler.require(*Rails.groups)

    config.to_prepare do
      Devise::SessionsController.layout 'login'
    end

    config.generators do |g|
      g.orm :active_record
      g.test_framework :rspec, spec: false, fixture: false
      g.stylesheets true
      g.javascripts true
      g.jbuilder true
      g.assets false
      g.helper false
    end
  end
end
