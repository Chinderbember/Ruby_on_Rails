# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user, -> { where(active: true) }, counter_cache: true
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commentators, through: :comments, source: :user

  scope :group_done_by_user_id, -> { where(done: true).select(:user_id).group(:user_id) }
end
