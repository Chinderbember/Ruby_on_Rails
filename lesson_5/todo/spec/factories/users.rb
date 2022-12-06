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
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| FFaker::Internet.user_name[0...10] + n.to_s }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:password) { |n| "person#{n}@example.com" }
    active { true }
    role { create(:role) }
  end
end
