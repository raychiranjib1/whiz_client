# WhizClient

[![Gem Version](https://badge.fury.io/rb/whiz_client.svg)](http://badge.fury.io/rb/whiz_client) [![Build Status](https://travis-ci.org/raychiranjib1/whiz_client.svg)](https://travis-ci.org/raychiranjib1/whiz_client) [![Code Climate](https://codeclimate.com/repos/5461c33f6956800ae807a7f0/badges/24da9482a4be8b92b3c3/gpa.svg)](https://codeclimate.com/repos/5461c33f6956800ae807a7f0/feed) [![Dependency Status](https://gemnasium.com/raychiranjib1/whiz_client.svg)](https://gemnasium.com/raychiranjib1/whiz_client) [![License](http://img.shields.io/license/MIT.png)](http://opensource.org/licenses/MIT) [![Coverage Status](https://coveralls.io/repos/raychiranjib1/whiz_client/badge.png)](https://coveralls.io/r/raychiranjib1/whiz_client)

A wrapper ruby library to access WhizApi. Get your api key from www.whizapi.com.

Using this library one can access following services...

    Get the list of major cities of a state in India.
    Get list of States and Union Territories of India.
    Get city/area from the STD code in India.
    Get STD dialing code for any location in India.
    Get address, City, Locality by pin code in India.
    Get pin code of any address, city, locality in India.
    Get list of all time zones in the world.
    Get current time of a particular time zone.

##  Supported versions

    Ruby 1.9.2, 1.9.3, 2.0.0, 2.1.x

## Installation

Add this line to your application's Gemfile:

    gem 'whiz_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whiz_client

## Usage

Add following code to your environment file

    WhizClient::Client::APP_KEY = '<your api key>' # Get your api key from www.whizapi.com

Get list of States and Union Territories of India.

    WhizClient::India.list_all_states

Get the list of major cities of a state in India.

    WhizClient::India.find_city_by_state(<state-id>)

Get city/area from the STD code in India.

    WhizClient::India.find_city_by_std_codes(<STD-CODE>)

Get STD dialing code for any location in India.

    WhizClient::India.find_std_codes_by_location(<city-name>)

Get address, City, Locality by pin code in India.

    WhizClient::India.find_city_by_postal_code(<pin code>)

Get pin code of any address, city, locality in India.

    WhizClient::India.find_postal_code_by_location(<location>)

Get list of all time zones in the world.

    WhizClient::Geo.time_zones

Get current time of a particular time zone.

    WhizClient::Geo.current_time_of_timezone(<time zone>)


## Error handaling

    begin
       WhizClient::India.list_all_states
       rescue WhizClient::WhizResponseError => e
       puts e.error_message
    end

    WhizClient::Client::APP_KEY is not defined

## Contributing

1. Fork it ( http://github.com/<my-github-username>/whiz_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run $ rspec.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request


## License

WhizClient is Copyright (c) 2014 Chiranjib Roy. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
