# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user, -> { where(active: true) }, counter_cache: true
  has_many :items
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user
end
