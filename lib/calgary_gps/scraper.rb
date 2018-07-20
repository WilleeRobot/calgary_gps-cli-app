class CalgaryGps::Scraper

  BASE_URL = "https://www.ratemds.com/best-doctors/ab/calgary/?verified=true&accepting_patients=true"

  def self.scrape_docs
    doc = Nokogiri::HTML(open(BASE_URL))
    # binding.pry

    #first doctor on the list is always an ad.. don't count this.
    doc.css(".doctor-profile").drop(1).each do |doctor|
      name = doctor.css(".search-item-doctor-name a").text.strip
      profile_url = "https://www.ratemds.com" + doctor.css(".search-item-doctor-name a").attribute('href').value
      rating = doctor.css(".selected").size
      CalgaryGps::Doctor.new(name, profile_url, rating)
    end
  end

  def self.scrape_doc_details(doctor)

    url = doctor.profile_url

    doc = Nokogiri::HTML(open(url))
    #HOW DO YOU SELECT AN NTH-CHILD (p) of a span in nokogiri?
    
    binding.pry

  end

end
