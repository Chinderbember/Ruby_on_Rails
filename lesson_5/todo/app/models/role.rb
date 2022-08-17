# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :code, presence: true
  validates :code, uniqueness: true

  has_many :users
end
