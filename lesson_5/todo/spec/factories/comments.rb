# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "Content#{n}" }
    user { create(:user) }
    if [0, 1].sample.zero?
      commentable_type { create(:user).class.to_s }
      commentable_id { User.last.id }
    else
      commentable_type { create(:event).class.to_s }
      commentable_id { Event.last.id }
    end
  end
end
