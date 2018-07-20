class CalgaryGps::Scraper

  BASE_URL = "https://www.ratemds.com/best-doctors/ab/calgary/family-gp/?verified=true&accepting_patients=true"

  def self.scrape_docs
    doc = Nokogiri::HTML(open(BASE_URL))
    binding.pry
    
  end

end
