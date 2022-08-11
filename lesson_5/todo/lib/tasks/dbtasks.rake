# frozen_string_literal: true

namespace :dbtasks do
  desc 'Task fills database with test_data.Parameter number sets number of lines with test data in each database'
  task :db_test_data_fill, [:number] do |_t, args|
    Rake::Task['environment'].invoke
    TestDataGenerator.fill(args[:number].to_i)
  end
end
