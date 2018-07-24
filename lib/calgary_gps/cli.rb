require 'pry'

class CalgaryGps::CLI

  def run
    welcome_screen

    make_doctors
    get_doctor_details

    main_menu
  end

  def main_menu
    puts ""

    #get user input
    user_input = gets.strip
    index = user_input.to_i

    if index == exit_option
      puts "Thank you for using the program!"
      #how do set a "not" equality operator below?
    elsif ((1..(CalgaryGps::Doctor.all.size)) === index)
      array_index = index - 1
      selected_doc= CalgaryGps::Doctor.all[array_index]
      show_doctor_details(selected_doc)
    else
      puts "You typed something invalid..."
      main_menu(exit_option)
    end
  end

  def welcome_screen
    puts "Welcome to Calgary GPs!"
    puts ""
  end

  def main_menu
    puts "To list all doctors, enter 'list doctors'."
    puts "To view further details of the list of doctors, enter the corresponding doctor number from the main doctor list."
    puts "To list all of the specialties, enter 'list specialties'."
    puts "To list all of the doctors of a particular specialty, enter 'list specialty'."
    puts "To quit, type 'exit'."
    puts ""
    puts "What would you like to do?"

    action = gets.strip

    case action
    when "exit"
      "exit"
    when "list doctors"
      self.list_doctors
    when "list specialties"
      self.list_specialties
    when "list specialty"
      self.list_doctors_by_specialty
    else
      puts "You've entered something invalid..."
      self.main_menu
    end
  end

  def make_doctors
    puts "Loading doctors.  Please wait..."
    #Scrape 'http://ratemymd.com' for list of docs (first page only..maybe I can improve this to get all results later...)
    doctor_hash = CalgaryGps::Scraper.scrape_docs
    CalgaryGps::Doctor.create_from_collection(doctor_hash)
    puts "Done!"
  end

  def get_doctor_details
    puts "Loading details for the doctors.  Please wait..."

    # #Scrape for the details of the doctor
    # CalgaryGps::Scraper.scrape_doc_details(doctor)

    #Scrape for doctor DETAILS
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
    puts "Here are a list of verified doctors in Calgary that are accepting patients."

    CalgaryGps::Doctor.all.each_with_index do |doctor, index|
      puts "#{index + 1}. #{doctor.name}"
      puts "   Rating: #{doctor.rating} stars"
      puts "   Specialty: #{doctor.specialty.name}"
      puts ""
    end
    # exit_option = CalgaryGps::Doctor.all.size + 1
    # puts "#{exit_option}. MAIN MENU"

    self.continue
    self.main_menu
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
  end

#press any key to continue prompt
def continue
  puts "Press any key to go back to the menu."
  gets
  print ""
end

end
