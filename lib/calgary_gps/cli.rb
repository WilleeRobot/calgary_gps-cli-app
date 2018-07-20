class CalgaryGps::CLI

  def run
    puts "Welcome to Calgary GPs!"

    #Scrape ratemymd for list of docs (first page only)
    CalgaryGps::Scraper.scrape_docs

    #show main menu interface
    main_menu
  end

  def main_menu
    puts "Here are a list of verified doctors in Calgary that are accepting patients."

    doctors = CalgaryGps::Doctor.all

    doctors.each_with_index(1) do |doctor, index|
      puts "#{index}. #{doctor.name}; Rating: #{doctor.rating} stars"
      n += 1
    end


  end


end
