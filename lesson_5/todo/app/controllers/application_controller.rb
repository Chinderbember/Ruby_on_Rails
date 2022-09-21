# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_locale_in_session
  before_action :set_default_locale

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_default_locale_in_session
    session[:locale] ||= I18n.default_locale.to_s
  end

  def set_default_locale
    I18n.locale = session.fetch(:locale, I18n.default_locale).to_sym
  end
end
