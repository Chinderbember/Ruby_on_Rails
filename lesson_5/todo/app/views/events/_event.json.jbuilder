# frozen_string_literal: true

json.ignore_nil!
json.extract! event, :id, :finished_at
json.name truncate(event.name)
json.content truncate(event.content)
json.user do
  json.name event.user.name
  json.email event.user.email
end
