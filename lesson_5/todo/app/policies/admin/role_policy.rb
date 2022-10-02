# frozen_string_literal: true

module Admin
  class RolePolicy < Admin::ApplicationPolicy
    def destroy?
      record.code != 'admin'
    end

    def update?
      destroy?
    end

    def edit?
      destroy?
    end
  end
end
