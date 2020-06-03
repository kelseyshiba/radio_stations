# Project Title - RadioStations

# Project - Description

This gem is designed to gather information on radio stations worldwide and allow users to sift through the information by giving them options to search by, add to their list, and open the websites of the stations they find.

## Installation

Execute
    $ bundle install

Use the command line to run
 ./bin/radio_stations

 require 'launchy'
 require 'rainbow'
 require 'open-uri'
 require 'net/http'
 require 'json'
 require 'pry'

## Usage

User menu includes a listing of alphabetical ranges, a list of saved user choices, and an optiona listing of all countries.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kelseyshiba/radio_stations. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kelseyshiba/radio_stations/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the RadioStations project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/radio_stations/blob/master/CODE_OF_CONDUCT.md).


# License
https://github.com/kelseyshiba/radio_stations/blob/master/LICENSE