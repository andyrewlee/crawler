require 'open-uri'
require 'nokogiri'

puts "Site name"
url = gets.chomp

page = Nokogiri::HTML(open(url))
content = page.css('span').collect{ |node| node.text}.join(" ")
puts content
