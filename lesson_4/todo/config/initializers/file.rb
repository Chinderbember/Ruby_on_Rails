# frozen_string_literal: true

class << File
  def linescount(file)
    count = 0

    File.open(file, 'r') do |f|
      f.each { |_line| count += 1 }
    end

    count
  end

  def test
    'gggggggg'
  end
end
