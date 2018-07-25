# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application

  The CLI for this application is located in the ./lib folder.  The executable file is located in the ./bin folder under the file calgary_gps.

- [x] Pull data from an external source

  The data is being pulled via the Nokogiri gem.  A separate class called Scraper, defined in the scraper.rb file located in the ./lib/calgary_gps folder, details the source.  In this case, the application will be scraping for the doctor details on the first page of the BASE_URL.

- [x] Implement both list and detail views

  The list view is what shows by default when the application is launched and the executable file is run.  The list is called using the CalgaryGps::CLI#list_doctors method.

  After #list_doctors is called the CalgaryGps::CLI#welcome_screen is called which details instructions for the user to drill down into a particular listed doctor.  When the option is selected, specific attributes of the doctors, namely his or her biography and whether they are accepting new patients, is shown (if available).  The user is able to read these details and then press any key to go back to the main list view.
