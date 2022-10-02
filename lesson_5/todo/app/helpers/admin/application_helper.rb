# frozen_string_literal: true

module Admin
  module ApplicationHelper
    def action_title(klass, action_name)
      action_case = (action_name == 'index' ? 'many' : 'accusative')

      [
        t("label.#{action_name}"),
        t("activerecord.models.#{klass.name.tableize.singularize}.#{action_case}")
      ].join(' ')
    end

    def stats_helper(model_object, relation)
      property_number = model_object.send(relation).count
      property_name_form = t("activerecord.models.#{relation.to_s.singularize}", count: property_number)
      "#{property_number} #{property_name_form}"
    end

    def activate_title(user)
      user.active? ? 'Disactivate' : 'Activate'
    end
  end
end
