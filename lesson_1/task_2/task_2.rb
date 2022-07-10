# frozen_string_literal: true

require 'faraday'

response = Faraday.get('https://gb.ru/courses/all?')

puts response.body.size
