# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                                           :bigint           not null, primary key
#  active(пользователь активен (true) или заблокирован (false)) :boolean          default(TRUE)
#  current_sign_in_at                                           :datetime
#  current_sign_in_ip                                           :string
#  email(Электронный адрес пользователя)                        :string
#  encrypted_password                                           :string           default(""), not null
#  events_count                                                 :integer
#  last_sign_in_at                                              :datetime
#  last_sign_in_ip                                              :string
#  name(Имя, которое используется для входа)                    :string
#  remember_created_at                                          :datetime
#  reset_password_sent_at                                       :datetime
#  reset_password_token                                         :string
#  settings(Индивидуальные параметры пользователя)              :jsonb
#  sign_in_count                                                :integer          default(0), not null
#  state(Статусная модель пользователя)                         :integer
#  created_at                                                   :datetime         not null
#  updated_at                                                   :datetime         not null
#  role_id(Роль пользователя)                                   :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
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

  def attributes
    super.select { |k, _v| %w[email name].include? k }
         .merge(description:)
  end

  def description
    "#{name} (#{email})"
  end

  def active_for_authentication?
    super && active?
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
