# frozen_string_literal: true

require 'faraday'
require 'nokogiri'
require 'json'

response = Faraday.get('https://gb.ru/')

html_doc = Nokogiri::HTML(response.body)

part_with_telephone = html_doc.xpath('//head//script').first.to_s

begin_pos = part_with_telephone.index('>') + 1
end_pos = part_with_telephone.rindex('<') - 1

tel_part_no_tags = part_with_telephone.slice(begin_pos..end_pos)

puts JSON.parse(tel_part_no_tags)['telephone']
