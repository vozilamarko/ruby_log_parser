# Ruby log parser script

This is a simple log parser script that receives a single file and returns calculations performed on containing data.
Expected log line format is route and ip address separated by space, example: 

`/help_page/1 126.318.035.038`

## Features

Script wil calculate and return two results:

1. list of routes and number of **visits** sorted in descending order
2. list of routes and number of **unique visits** sorted in descending order

## Installing instructions

Check if Ruby is installed on your system using cli command:

`ruby -v`

If no version is returned you should install Ruby first.
Next cd into the root of the downloaded or cloned repository and run command:

`bundle install`

Which will install all dependencies included in project Gemfile.
After that you should be all set to use the script.

## Usage instructions

After successful installation you can start the script from the rooot folder using:

`ruby parse_my_log.rb path/name.log`

Where **path/name.log** is path and name of log that you want to parse relative to the script.

For presentation purposes sample logs are provided in samples folder:

`samples/webserver.log - behaviour when log is valid with valid data`

`samples/partially_valid.log - behaviour when log is valid with partialy valid data`

`samples/faulty_data.log - behaviour when log data is invalid`

`samples/empty.log - behaviour when there is no log data`

## Test instructions

To run provided rspec tests run the command:

`bundle exec rspec spec`

From root directory.

If you want to run only individual spec run command:

`bundle exec rspec spec/name_spec.rb`

## Linting instructions

Linter used in this projet was **rubocop**

In order to run linting on your change use command:

`rubocop`

From root folder.

## Dependencies

`ruby`

`bundler`

RubyGems:

`rspec`

`rubocop`
