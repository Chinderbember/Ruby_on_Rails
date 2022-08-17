# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, comment: 'Комментарии пользователей к делам' do |t|
      t.text :content, comment: 'Содержимое комментария'
      t.references :user, foreign_key: true,
                          comment: 'Внешний ключ для связи с таблицей users'
      t.references :event, foreign_key: true,
                           comment: 'Внешний ключ для связи с таблицей events'

      t.timestamps
    end
  end
end
