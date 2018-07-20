class CalgaryGps::CLI

  def run
    puts "Welcome to Calgary GPs!"

    #display docs
    CalgaryGps::Scraper.scrape_docs
    main_menu
  end

  def main_menu
    puts "Here are a list of doctors in Calgary that are verified and top rated."

    doctors = CalgaryGps::Doctor.all

    n = 1

    doctors.each do |doctor|
      puts "#{n}. #{doctor.name}"
      n += 1
    end

  end


end
