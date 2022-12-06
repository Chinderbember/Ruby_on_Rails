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
RSpec.describe Role, type: :model do
  subject { build(:role) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code) }
  it { is_expected.to have_many(:users) }
end
