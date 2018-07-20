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

    doctors.each_with_index do |doctor, index|
      puts "#{index + 1}. #{doctor.name}; Rating: #{doctor.rating} stars"
    end

    puts ""
    puts "Select a doctor to view biography and specialty."

    user_input = gets.strip
    index = user_input.to_i

    doctor = CalgaryGps::Doctor.all[index - 1]

    CalgaryGps::Scraper.scrape_doc_details(doctor)



  end


end
