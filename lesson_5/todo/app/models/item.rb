# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :event_id, presence: true
end
