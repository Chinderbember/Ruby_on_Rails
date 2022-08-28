# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Класс TestHomework::User' do
  n = 100

  let(:attributes) do
    %i[surname name patronymic email]
  end

  let(:test_homework_users_and_values) do
    values_arr = []
    users_arr = []
    n.times do |counter|
      values_arr << attributes.map { |el| "test_#{el}#{counter + 1}" }
      users_arr << TestHomework::User.new(*values_arr.last)
    end
    [values_arr, users_arr]
  end

  it 'должен сохранять фамилию, имя, отчество, email' do
    values_arr = test_homework_users_and_values.first
    users_arr = test_homework_users_and_values.last
    test_arr = []

    n.times do |user_counter|
      conditions_arr = []

      attributes.size.times do |attr_counter|
        value_fst = users_arr.map(&attributes[attr_counter])[user_counter]
        value_snd = values_arr.dig(user_counter, attr_counter)
        condition = (value_fst == value_snd)
        conditions_arr << condition
      end

      test_arr << conditions_arr.all?
    end

    expect(test_arr.all?).to be_truthy
  end
end
# rubocop:enable Metrics/BlockLength
