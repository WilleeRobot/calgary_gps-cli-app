MY CLI PROJECT

1. Plan gem: what is the interface?
2. Google project structure
3. Start with entry point - file run
4. Hard card CLI interface
5. Stub out interface
7. Discover objects
8. Program


IDEA: Listing family GPs in Calgary (verified and accepting patients).
INITIAL MODEL: Model out first page first; need to query how to do multiple pages.
WEBSITE: https://www.ratemds.com/best-doctors/ab/calgary/family-gp/?verified=true&accepting_patients=true

INITIAL INTERFACE:

a) Greets user with:
    "The Best Verified, Accepting Patients Family Doctors / G.P.s in Calgary, AB"

    "Please choose an option below: "
      -> 1. List all doctors
      -> 2. List doctors by specialty:
      -> 3. Exit
    "Enter an option: "

    b) IF 1. List doctors is selected THEN
        --> List doctors by number.
              -> name
                -> show doctor star rating;
                -> specialty;
        --> PROMPT: "Select a doctor to view bio, type 'back' to go back, or type 'exit' to exit.

    c) If 2. List doctors by star rating - select 0 - 5 stars: is selected, THEN
        --> List doctors by rating.
              -> name
                -> list doctor badge descriptions;
        --> PROMPT: "Select a doctor to view bio, type 'back' to go back, or type 'exit' to exit.

    d) IF 3. Exit is selected, THEN
        display - "Thank you for using the program!"
        <end program>
