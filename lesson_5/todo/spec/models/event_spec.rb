# frozen_string_literal: true

RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to belong_to(:user).conditions(active: true) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it {
    is_expected.to have_many(:commentators)
      .through(:comments)
      .source(:user)
  }
end
