# frozen_string_literal: true

module ApplicationHelper
  def current_date
    Date.current.to_s
  end

  def list_tag(arr)
    output = arr.reduce('ul') do |result, element|
      result + "\n  li #{element}"
    end
    render inline: output, type: :slim
  end

  def language_link_name
    session[:locale] == I18n.default_locale.to_s ? 'EN' : 'RU'
  end
end
