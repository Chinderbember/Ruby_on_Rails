# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  before_validation :normalize_email, if: proc { |u| u.email.present? }
  after_initialize :set_default_role

  Role.find_each do |role|
    define_method "#{role.code}?" do
      role_id == role.id
    end
  end

  private

  def normalize_email
    self.email = email.downcase
  end

  def set_default_role
    self.role_id ||= Role.find_by(code: :default).id
  end

  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true

  store :settings, coder: JSON
  store_accessor :settings, :per_page, :time_zone, :show_help

  enum state: {
    created: 1,
    email_verified: 2,
    studied: 3,
    actived: 4,
    disabled: 5
  }

  belongs_to :role
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_events,
           through: :comments,
           source: :commentable,
           source_type: :Event
  has_many :commented_users,
           through: :comments,
           source: :commentable,
           source_type: :User
  has_many :items,
           through: :events
end
