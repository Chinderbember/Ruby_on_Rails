# frozen_string_literal: true

desc 'counts age from birthdate'
task :age, [:day, :month, :year] do |_t, args|
  current_time = Time.now
  current_day = current_time.day
  current_month = current_time.month
  current_year = current_time.year

  age = current_year - args[:year].to_i
  definition_fst = current_month < args[:month].to_i
  definition_snd = current_month == args[:month].to_i && current_day < args[:day].to_i

  age -= 1 if definition_fst || definition_snd

  puts age
end
