# CalgaryGps

This gem utilizes the popular web-scraping ruby gem NOKOGIRI to obtain certain professional details of medical doctors in Calgary, AB, Canada.
It will list doctors and provide his or her name, specialty, and rating out of 5 based on users of https://ratemymd.com.

Users can then drill into any one particular doctor to view his or her biography, if available, and whether or not the doctor is accepting new patients (if this detail is provided.)

Users can also view a list of doctors by specialty.

** The code is a work in progress.  In its current form, the application only scrapes the first page of the link above (actual number of pages varies).  Therefore, only the first page of doctors is displayed.  Suggestions on how to improve user functionality is welcome. **

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calgary_gps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calgary_gps

## Usage

When running the executable file (./bin/calgary_gps), the program will take some time to grab a list of doctors and associated details and list them by number.

LIST DOCTORS:

1. To view details of a particular doctor, select the number corresponding to the doctor you wish to view further details about.
2. The prompt will then show the selected doctor's biography and whether he or she is accepting new patients.
3. To go back to the main menu, hit any key

LIST SPECIALTIES:

1. To view a list of doctors sorted and categorized by a particular specialty, type 'list specialities'.
2. The prompt will then show all of the specialities on the particular page that was scraped and list the doctors belonging to that specialty.
3. To go back to the main menu, hit any key

EXIT
1. To exit the program, type 'exit'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/freeWillee/calgary_gps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

TO SUBMIT PULL REQUEST:

1) Fork and clone the repo: git clone git@github.com:freeWillee/calgary_gps-cli-app.git
2) Setup machine by running: ./bin/setup
3) Make changes
4) Add tests for changes if possible
5) Push to your local fork and submit pull request: https://github.com/freeWillee/calgary_gps-cli-app/pulls

** Please allow for at least 3 business days before receiving a response.  Please write tests for changes and write good commit messages."

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CalgaryGps project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/freeWillee/calgary_gps/blob/master/CODE_OF_CONDUCT.md).
