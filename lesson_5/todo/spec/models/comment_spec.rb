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
RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:commentable) }
end
