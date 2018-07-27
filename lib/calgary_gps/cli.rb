require 'pry'
require 'io/console'

class CalgaryGps::CLI
  def run
    #welcome
    welcome_screen
    make_doctors
    get_doctor_details
    list_doctors
    main_menu
  end

  def welcome_screen
    puts "Welcome to Calgary GPs!"
    puts ""
  end

  def main_menu
    puts "To view further details of the list of doctors, enter the corresponding doctor number from the main doctor list."
    puts ""
    puts "To list all of the doctors by specialty, enter 'list specialties'."
    puts ""
    puts "To quit, type 'exit'."
    puts ""
    puts ""
    puts "What would you like to do?"

    user_input = gets.strip

    #show doctor details if user input is between 1 and # of doctors listed (i.e. the @@all - all docs)
    if ((1..(CalgaryGps::Doctor.all.size)) === user_input.to_i)
      array_index = user_input.to_i - 1
      selected_doc= CalgaryGps::Doctor.all[array_index]
      show_doctor_details(selected_doc)
    else
      # cover all other user input possibilities
      case user_input
      when "exit"
        "exit"
      when "list specialties"
        self.list_specialties
      else
        puts "You've entered something invalid... let's try that again."
        puts ""
        self.main_menu
      end
    end
  end

  def make_doctors
    puts "Loading doctors.  Please wait..."
    #Scrape 'http://ratemds.com' for list of docs (first page only..maybe I can improve this to get all results later...)
    doctor_hash = CalgaryGps::Scraper.scrape_docs
    CalgaryGps::Doctor.create_from_collection(doctor_hash)
    puts "Done!"
  end

  def get_doctor_details
    puts "Loading details for the doctors.  Please wait..."

    #Scrape for the details of the doctor;
      # => Consider only running this method only if user selects a doctor - save time and memory?
    CalgaryGps::Doctor.all.each do |doctor|
      details_hash = CalgaryGps::Scraper.scrape_doc_details(doctor)
      details_hash.each do |key, value|
        doctor.send("#{key}=", value)
      end
    end
    puts "Done!"
    puts ""
  end

  def list_doctors
    puts "Here is a sample list of Calgary's medical practitioners: "
    puts ""

    CalgaryGps::Doctor.all.each_with_index do |doctor, index|
      puts "#{index + 1}. #{doctor.name}"
      puts "   Rating: #{doctor.rating} stars"
      puts "   Specialty: #{doctor.specialty.name}"
      puts ""
    end
  end

  def show_doctor_details(doctor)
    puts "Here is the available information for #{doctor.name}."
    puts ""
    puts "Biography: "
    puts doctor.biography
    puts ""
    puts "Accepting patients: "
    puts doctor.accepting_patients
    puts ""

    continue
    list_doctors
    main_menu
  end

  #press any key to continue prompt
  def continue
    puts "Press any key to go back to the menu."
    STDIN.getch
    puts ""
  end

  def list_specialties
    puts "Here are a list of doctors by specialty:"
    puts ""

    CalgaryGps::Specialty.all.each_with_index do |specialty, index|
      puts "#{index + 1}. #{specialty.name}"
      specialty.doctors.each_with_index do |doctor, index|
        puts "  #{index + 1}. #{doctor.name}"
      end
    end

    puts ""

    continue
    list_doctors
    main_menu
  end
end
