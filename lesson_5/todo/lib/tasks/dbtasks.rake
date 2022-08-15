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
    TRUNCATE roles, users, events, items RESTART IDENTITY;
    HERE
    ActiveRecord::Base.connection.execute(sql)
  end
end
