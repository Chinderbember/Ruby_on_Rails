# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                                               :bigint           not null, primary key
#  content(Детальное описание)                      :text
#  done(Статус: завершено (true), или нет (false))  :boolean          default(FALSE)
#  finished_at(Дата и время завершения дела)        :datetime
#  name(Заголовок)                                  :string
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#  user_id(Внешний ключ для связи с таблицей users) :bigint
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to belong_to(:user).conditions(active: true) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it {
    expect(subject).to have_many(:commentators)
      .through(:comments)
      .source(:user)
  }
end
