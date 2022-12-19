# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Todo
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.default_locale = :ru
    config.i18n.available_locales = %i[ru en]
    config.time_zone = 'Moscow'

    config.generators.system_tests = nil
    config.autoload_paths << Rails.root.join('lib')
    config.paths.add Rails.root.join('app/api/helpers').to_s, eager_load: true

    config.active_job.queue_adapter = :resque
  end
end
