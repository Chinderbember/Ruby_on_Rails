# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    sequence(:name) { |n| "Event_name#{n}" }
    sequence(:content) { |n| "Content_name#{n}" }
    done { rand.round.zero? }
    user { create(:user) }
  end
end
