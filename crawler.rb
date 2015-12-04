class ProfileCrawler
  def self.crawl(url)
    begin
      page = Nokogiri::HTML(open(url))
      title = page.css('h1.course-title')[0].text.strip
      rate_count = page.css('.rate-count')[0].text.strip
      average_rating = page.css('.average-rate')[0].text.strip
      instructor_name = page.css('.ins-name')[0].text
      instructor_bio = page.css('.mt10 .js-simple-collapse-inner p').select { |node| !node.text.empty? }.collect { |node| node.text.strip }.join(" ")
      social_media = page.css('.mt5 a').collect{ |node| node["href"] }


      twitter = nil
      facebook = nil
      google = nil
      youtube = nil
      linkedin = nil
      website = nil

      social_media.each do |account|
        if account.match("twitter")
          twitter = account
        elsif account.match("facebook")
          facebook = account
        elsif account.match("google")
          google = account
        elsif account.match("youtube")
          youtube = account
        elsif account.match("linkedin")
          linkedin = account
        else
          website = account
        end
      end

      # splits stats into array with only numbers
      stats = rate_count.scan(/\d+/)

      profile = Profile.new(title, stats[0], average_rating, stats[1], instructor_name, instructor_bio, twitter, facebook, google, youtube, linkedin, website)
      return profile
    rescue
      return nil
    end
  end
end

class Profile
  attr_accessor :title, :rate_count, :average_rating, :students_enrolled, :instructor_name, :instructor_bio, :twitter, :facebook, :google, :youtube, :linkedin, :website
  def initialize(title, rate_count, average_rating, students_enrolled, instructor_name, instructor_bio, twitter, facebook, google, youtube, linkedin, website)
    @title = title
    @rate_count = rate_count
    @average_rating = average_rating
    @students_enrolled = students_enrolled
    @instructor_name = instructor_name
    @instructor_bio = instructor_bio
    @twitter = twitter
    @facebook = facebook
    @google = google
    @youtube = youtube
    @linkedin = linkedin
    @website = website
  end

  def to_s
    "Title: #{@title}\n
     Rate Count: #{@rate_count}\n
     Average Rating: #{@average_rating}\n
     Students Enrolled: #{@students_enrolled}\n
     Name: #{@instructor_name}\n
     Bio: #{@instructor_bio}\n
     Twitter: #{@twitter}\n
     Facebook: #{@facebook}\n
     Google: #{@google}\n
     Youtube: #{@youtube}\n
     Linkedin: #{@linkedin}\n
     Website: #{@website}\n"
  end
end
