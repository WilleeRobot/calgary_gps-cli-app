require 'pry'

class CalgaryGps::CLI

  def run
    welcome_screen
    make_doctors
    list_doctors
    exit_option = CalgaryGps::Doctor.all.size + 1
    puts "#{exit_option}. EXIT PROGRAM"

    main_menu(exit_option)
  end

  def main_menu(exit_option)
    puts ""
    puts "Select a doctor to view doctor details, or type #{exit_option} to exit the program."

    #get user input
    user_input = gets.strip
    index = user_input.to_i
    array_index = index - 1

    if index == exit_option
      puts "Thank you for using the program!"
      #how do set a "not" equality operator below?
    elsif ((1..(CalgaryGps::Doctor.all.size)) === index)
      selected_doc= CalgaryGps::Doctor.all[array_index]
      get_doctor_details(selected_doc)

    else
      puts "You typed something invalid..."
      main_menu(exit_option)
    end
  end

  def welcome_screen
    puts "Welcome to Calgary GPs!"
    puts ""
  end

  def make_doctors
    #Scrape 'http://ratemymd.com' for list of docs (first page only..maybe I can improve this to get all results later...)
    doctor_hash = CalgaryGps::Scraper.scrape_docs
    CalgaryGps::Doctor.create_from_collection(doctor_hash)
  end

  def list_doctors
    puts "Here are a list of verified doctors in Calgary that are accepting patients."

    CalgaryGps::Doctor.all.each_with_index do |doctor, index|
      puts "#{index + 1}. #{doctor.name}"
      puts "   Rating: #{doctor.rating} stars"
      puts "   Specialty: #{doctor.specialty.name}"
      puts ""
    end
  end

  def get_doctor_details(doctor)
    #Scrape for the details of the doctor
    puts "TEST: about to scrape for doctor details"
    # binding.pry
    #scrape_doc_details expected to return hash...
    CalgaryGps::Scraper.scrape_doc_details(doctor)

  end

end
