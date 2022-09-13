# frozen_string_literal: true

module DevSettingsPart
  def generator_set
    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework nil
      g.helper false
      g.stylesheets false
      g.javascripts false
      g.factory_bot dir: 'spec/factories'
    end
  end

  def cache_settings_set
    if Rails.root.join('tmp', 'caching-dev.txt').exist?
      cache_settings_if_actions
    else
      config.action_controller.perform_caching = false

      config.cache_store = :null_store
    end
  end

  def cache_settings_if_actions
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  end
end
