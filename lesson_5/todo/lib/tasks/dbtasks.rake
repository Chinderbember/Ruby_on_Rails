# frozen_string_literal: true

namespace :dbtasks do
  desc 'Task fills database with test_data.Parameter number sets number of lines with test data in each database'
  task :db_test_data_fill, [:number] do |_t, args|
    Rake::Task['environment'].invoke
    TestDataGenerator.fill(args[:number].to_i)
  end

  desc "Clean all lines and reset id counters in db's tables"
  task deep_clean: :environment do
    sql = <<-HERE
    TRUNCATE roles, comments, users, events, items RESTART IDENTITY;
    HERE
    ActiveRecord::Base.connection.execute(sql)
  end

  desc "Get array of all items of certain User's all events"
  task :all_user_items, [:user_id] do |_t, args|
    Rake::Task['environment'].invoke
    certain_user = User.find(args[:user_id].to_i)
    arr = certain_user.events.map(&:items).to_a.flatten
    arr.each { |el| p el }
    puts
    puts "Total: #{arr.size}"
  end
end
