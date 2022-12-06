# frozen_string_literal: true

RSpec.describe 'Класс TestHomework::User' do
  let(:n) { 100 }

  let(:attributes) { %i[surname name patronymic email] }

  def test_homework_users_and_values
    values_arr = users_arr = []
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
        conditions_arr << (value_fst == value_snd)
      end

      test_arr << conditions_arr.all?
    end

    expect(test_arr).to be_all
  end
end
