# frozen_string_literal: true

desc 'counts all lines in .rb files of project'
task all_ruby_files_lines_count: :environment do
  template = '/**/*.rb'

  dir_arg = File.join('../..', template)

  puts Dir[dir_arg].reduce(0) { |count, file| count + File.linescount(file) }
end
