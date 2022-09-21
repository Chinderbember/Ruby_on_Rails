# frozen_string_literal: true

class LocalesController < ApplicationController
  def toggle
    session[:locale] = (session[:locale] == 'ru' ? 'en' : 'ru')

    redirect_back(fallback_location: root_path)
  end
end
