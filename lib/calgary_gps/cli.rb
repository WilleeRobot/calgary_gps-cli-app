class CalgaryGps::CLI

  def run
    puts "Welcome to Calgary GPs!"
    puts "Here are a list of GPs in Calgary that are verified and top rated."

    #display docs
    CalgaryGps::Scraper.scrape_docs
  end

end
