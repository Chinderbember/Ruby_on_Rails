# frozen_string_literal: true

module Entities
  class User < Grape::Entity
    root 'users', 'user'

    expose :id,
           :name

    expose :role, using: Entities::Role do
      user.role
    end
  end
end
