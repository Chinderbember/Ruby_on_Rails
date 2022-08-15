# frozen_string_literal: true

class TestDataGenerator
  class << self
    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def fill(number)
      number.times do |counter|
        create_model(Role,
                     id: counter + 1,
                     name: "role_#{counter + 1}",
                     code: "code_#{counter + 1}")

        create_model(User,
                     id: counter + 1,
                     name: "user_#{counter + 1}",
                     email: "user_#{counter + 1}@test.ru",
                     role_id: counter + 1)

        create_model(Event,
                     id: counter + 1,
                     name: "event_#{counter + 1}",
                     user_id: counter + 1)

        create_model(Item,
                     id: counter + 1,
                     name: "item_#{counter + 1}",
                     event_id: counter + 1)
      end
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

    def create_model(klass, params)
      klass.create!(params)
    end
  end
end
