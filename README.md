[![Gem Version](https://badge.fury.io/rb/arbor_peakflow_ruby.svg)](http://badge.fury.io/rb/arbor_peakflow_ruby) [![Build Status](https://travis-ci.org/kkirsche/arbor_peakflow_ruby.svg?branch=master)](https://travis-ci.org/kkirsche/arbor_peakflow_ruby) [![Dependency Status](https://gemnasium.com/kkirsche/arbor_peakflow_ruby.svg)](https://gemnasium.com/kkirsche/arbor_peakflow_ruby) [![Code Climate](https://codeclimate.com/github/kkirsche/arbor_peakflow_ruby/badges/gpa.svg)](https://codeclimate.com/github/kkirsche/arbor_peakflow_ruby) [![Test Coverage](https://codeclimate.com/github/kkirsche/arbor_peakflow_ruby/badges/coverage.svg)](https://codeclimate.com/github/kkirsche/arbor_peakflow_ruby)


# Arbor Peakflow in Ruby

Welcome to Arbor Peakflow! In this library you will find the tools you need as a user and as a developer to interact with the Arbor Networks Peakflow Web Services API 6.0. Hope you enjoy!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arbor_peakflow_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arbor_peakflow_ruby

## Usage

Within your application, create a client. With the client, you can access then all available actions (refer to RDocs for info on these). Each response has a `.body`, `.status`, and `.headers` methods. Status returns the HTTP status code, such as 200. Body returns the response body, and Headers returns the response headers.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/kkirsche/arbor_peakflow_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
