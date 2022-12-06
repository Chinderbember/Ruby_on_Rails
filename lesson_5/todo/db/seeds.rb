# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.destroy_all
Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

default_role = Role.create!(name: 'Пользователь', code: :default)
admin_role = Role.create!(name: 'Администратор', code: :admin)

admin_email = 'admin@example.com'
User.create! name: 'Администратор',
             email: admin_email,
             password: admin_email,
             role: admin_role

# rubocop:disable Style/HashSyntax
hash_users = Array.new(10) do
  email = FFaker::Internet.safe_email
  {
    name: FFaker::Internet.user_name[0..15],
    email: email,
    password: email,
    role: default_role
  }
end
# rubocop:enable Style/HashSyntax

users = User.create! hash_users

hash_events = Array.new(20) do
  {
    name: FFaker::HipsterIpsum.paragraph,
    content: FFaker::HipsterIpsum.paragraphs,
    user: users.sample,
    finished_at: Time.zone.now + NotifyMailer::SECONDS_IN_DAY * rand(1..2)
  }
end

events = Event.create! hash_events
hash_items = Array.new(200) do
  {
    name: FFaker::HipsterIpsum.paragraph,
    event: events.sample
  }
end
Item.create! hash_items

hash_comments = Array.new(200) do
  commentable = (rand(2) == 1 ? events : users).sample
  {
    content: FFaker::HipsterIpsum.paragraphs,
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s
  }
end
Comment.create! hash_comments
