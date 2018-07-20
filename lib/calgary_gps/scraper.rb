class CalgaryGps::Scraper

  BASE_URL = "https://www.ratemds.com/best-doctors/ab/calgary/?verified=true&accepting_patients=true"

  def self.scrape_docs
    doc = Nokogiri::HTML(open(BASE_URL))
    # binding.pry

    doc.css(".doctor-profile").each do |doctor|
      name = doctor.css(".search-item-doctor-name a").text.strip
      profile_url = "https://www.ratemds.com" + doctor.css(".search-item-doctor-name a").attribute('href').value
      puts name
      puts profile_url
      # binding.pry
    end
  end

end
