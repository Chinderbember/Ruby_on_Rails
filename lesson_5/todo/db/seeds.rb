# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

Role.create!(name: 'Пользователь', code: :default)

hash_users = 10.times.map do
  {
    name: FFaker::Internet.user_name[0..15],
    email: FFaker::Internet.safe_email,
    role_id: Role.find_by(code: :default).id
  }
end

users = User.create! hash_users

hash_events = 20.times.map do
  {
    name: FFaker::HipsterIpsum.paragraph,
    content: FFaker::HipsterIpsum.paragraphs,
    user_id: users.sample.id
  }
end

events = Event.create! hash_events
hash_items = 200.times.map do
  {
    name: FFaker::HipsterIpsum.paragraph,
    event_id: events.sample.id
  }
end
Item.create! hash_items
