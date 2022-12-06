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
class Event < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user, -> { where(active: true) }, counter_cache: true, inverse_of: :events
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commentators, through: :comments, source: :user

  scope :group_done_by_user_id, -> { where(done: true).select(:user_id).group(:user_id) }
end
