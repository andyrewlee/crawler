require 'open-uri'
require 'nokogiri'


185774.upto(185774 + 50) do |i|
  url = "https://www.udemy.com/#{i}/"
  begin
    page = Nokogiri::HTML(open(url))
    content = page.css('.mt5 a').collect{ |node| node["href"] }
    puts content
  rescue
    puts "Error"
  end
end
