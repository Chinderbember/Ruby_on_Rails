# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    (record.id == user.id) || user.admin?
  end

  def destroy?
    condition?
  end

  def update?
    condition?
  end

  private

  def condition?
    ((record.id == user.id) && user.default?) ||
      ((record.id != user.id) && user.admin?)
  end
end
