# frozen_string_literal: true

module ProdSettingsPart
  def actionmailer_set
    config.action_mailer.delivery_method :smtp
    config.action_mailer.smtp_settings = {
      ssl: true,
      address: 'smtp.yandex.ru',
      port: 465,
      authentication: 'login',
      user_name: 'inculto',
      password: ''
    }
  end
end
