# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  code(Псевдоним) :string
#  name(Заголовок) :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Role < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true

  has_many :users, dependent: :nullify
end
