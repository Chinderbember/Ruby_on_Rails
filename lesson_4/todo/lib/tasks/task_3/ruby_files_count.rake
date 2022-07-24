# frozen_string_literal: true

desc 'counts files .rb in project'
task :ruby_files_count do
  puts Dir['./**/*.rb'].count
end
