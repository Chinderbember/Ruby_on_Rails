# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      add_trackable_fields(t)
    end

    add_index :users, :reset_password_token, unique: true
  end

  def self.add_trackable_fields(table)
    table.integer  :sign_in_count, default: 0, null: false
    table.datetime :current_sign_in_at
    table.datetime :last_sign_in_at
    table.string   :current_sign_in_ip
    table.string   :last_sign_in_ip
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
