# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id                                               :bigint           not null, primary key
#  commentable_type                                 :string           not null
#  content(Содержимое комментария)                  :text
#  created_at                                       :datetime         not null
#  updated_at                                       :datetime         not null
#  commentable_id                                   :bigint           not null
#  user_id(Внешний ключ для связи с таблицей users) :bigint
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "Content#{n}" }
    user { create(:user) }
    if [0, 1].sample.zero?
      commentable_type { create(:user).class.to_s }
      commentable_id { User.last.id }
    else
      commentable_type { create(:event).class.to_s }
      commentable_id { Event.last.id }
    end
  end
end
