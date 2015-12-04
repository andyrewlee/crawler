require 'open-uri'
require 'nokogiri'
require "csv"
require_relative 'crawler'

# title
# category
# instructor
# instructor bio
# number of students enrolled
# social media accounts

profiles = []
1.times do |t|
  url = "https://www.udemy.com/314462"
  profile = ProfileCrawler.crawl(url)
  profiles << profile
  puts t
  puts profile
end

CSV.open("file.csv", "ab") do |csv|
#  csv << ["Title", "Category", "Rate Count", "Average Rating", "Students Enrolled", "Instructor Name", "Instructor Bio", "Twitter", "Facebook", "Google", "YouTube", "LinkedIn", "Website"]
  profiles.each do |p|
    csv << [p.title, p.category, p.rate_count, p.average_rating, p.students_enrolled, p.instructor_name, p.instructor_bio, p.twitter, p.facebook, p.google, p.youtube, p.linkedin, p.website] if p != nil && !p.title.empty?
  end
end
