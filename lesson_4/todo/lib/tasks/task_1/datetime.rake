# frozen_string_literal: true

desc 'new file tmp/development.txt with time and date'
task :datetime do
  File.new('tmp/development.txt', 'w').puts Time.now
end
