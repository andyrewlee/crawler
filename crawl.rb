require 'open-uri'
require 'nokogiri'

# title
# category
# instructor
# instructor bio
# number of students enrolled
# social media accounts

url = "https://www.udemy.com/185774"

begin
  page = Nokogiri::HTML(open(url))
  title = page.css('h1.course-title')[0].text.strip
  social_media = page.css('.mt5 a').collect{ |node| node["href"] }
  rate_count = page.css('.rate-count')[0].text.strip
  instructor_name = page.css('.ins-name')[0].text
  instructor_bio = page.css('.mt10 .js-simple-collapse-inner p').collect { |node| node.text.strip }
  puts title
  puts instructor_name
  puts instructor_bio
  puts rate_count
  puts social_media
rescue
  puts "Error"
end
