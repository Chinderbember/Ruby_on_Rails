# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users, comment: 'Пользователи системы' do |t|
      t.with_options index: { unique: true } do
        string :name, comment: 'Имя, которое используется для входа'
        string :email, comment: 'Электронный адрес пользователя'
      end
      t.boolean :active,
                default: true,
                comment: 'пользователь активен (true) или заблокирован (false)'

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
