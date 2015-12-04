require 'open-uri'
require 'nokogiri'
require_relative 'crawler'

# title
# category
# instructor
# instructor bio
# number of students enrolled
# social media accounts

url = "https://www.udemy.com/185774"

profile = ProfileCrawler.crawl(url)
puts profile
