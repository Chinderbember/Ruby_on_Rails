# frozen_string_literal: true

module Entities
  class Role < Grape::Entity
    root 'roles', 'role'

    expose :name,
           :code
  end
end
