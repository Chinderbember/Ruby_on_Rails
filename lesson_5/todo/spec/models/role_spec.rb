# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  subject { build(:role) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_uniqueness_of(:code) }
  it { is_expected.to have_many(:users) }
end
