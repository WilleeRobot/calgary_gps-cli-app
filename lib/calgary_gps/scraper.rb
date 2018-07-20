class CalgaryGps::Scraper

  BASE_URL = "https://www.ratemds.com/best-doctors/ab/calgary/?verified=true&accepting_patients=true"

  def self.scrape_docs
    doc = Nokogiri::HTML(open(BASE_URL))
    # binding.pry

    #first doctor on the list is always an ad.. don't count this.
    doc.css(".doctor-profile").drop(1).each do |doctor|
      name = doctor.css(".search-item-doctor-name a").text.strip
      profile_url = "https://www.ratemds.com" + doctor.css(".search-item-doctor-name a").attribute('href').value

      CalgaryGps::Doctor.new(name, profile_url)
    end
  end

end
