# frozen_string_literal: true

module Admin
  class RolePolicy < Admin::ApplicationPolicy
    def destroy?
      Rails.logger.info '################3'
      Rails.logger.info record.inspect
      Rails.logger.info '################3'
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
