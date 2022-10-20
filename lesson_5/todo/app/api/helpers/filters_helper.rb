# frozen_string_literal: true

module FiltersHelper
  extend Grape::API::Helpers

  def all?
    ActiveRecord::Type::Boolean.new.cast(params[:all])
  end

  def event_scope
    all? ? policy_scope(Event).includes(user: :role).all : policy_scope(Event).includes(user: :role).where(done: false)
  end

  def warden
    env['warden']
  end

  def authenticated_user
    if warden.authenticated?
      true
    else
      error!('401 Unauthorized', 401)
    end
  end

  def current_user
    warden.user
  end
end
