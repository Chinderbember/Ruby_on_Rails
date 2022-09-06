# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  def show?
    record.user_id == user.id || user.admin?
  end

  def destroy?
    record.user_id == user.id || user.admin?
  end

  def update?
    record.user_id == user.id || user.admin?
  end

  class Scope < Scope
    def resolve
      PolicyFilter.return_filtered_scope(user, scope)
    end
  end
end
