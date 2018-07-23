require 'pry'

class CalgaryGps::CLI

  def run
    welcome_screen
    make_doctors
    list_doctors
    main_menu
  end

  def main_menu
    puts "Select a doctor to view biography and specialty, or type 'exit' to exit the program."

    #get user input
    user_input = gets.strip
    index = user_input.to_i

    selected_doc= CalgaryGps::Doctor.all[index - 1]

    CalgaryGps::Scraper.scrape_doc_details(selected_doc)

  end

  def welcome_screen
    puts "Welcome to Calgary GPs!"
  end

  def make_doctors
    #Scrape 'http://ratemymd.com' for list of docs (first page only..maybe I can improve this to get all results later...)
    doctor_hash = CalgaryGps::Scraper.scrape_docs
    CalgaryGps::Doctor.create_from_collection(doctor_hash)
  end

  def list_doctors
    puts "Here are a list of verified doctors in Calgary that are accepting patients."

    CalgaryGps::Doctor.all.each_with_index do |doctor, index|
      puts "#{index + 1}. #{doctor.name}; Rating: #{doctor.rating} stars"
    end

    puts ""
  end

end
