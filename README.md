# CongressV3

[![Coverage Status](https://coveralls.io/repos/github/CharlesMassry/CongressV3/badge.svg?branch=master)](https://coveralls.io/github/CharlesMassry/CongressV3?branch=master)
[![Build Status](https://travis-ci.org/CharlesMassry/CongressV3.svg?branch=master)](https://travis-ci.org/CharlesMassry/CongressV3)

Easily access the CongressV3 API through Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'CongressV3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install CongressV3

## Usage

First configure with your API KEY from [Sunlight Foundation](http://sunlightfoundation.com/api/accounts/register/)

Once you have your API KEY:

```ruby
CongressV3::Config.api_key = "MY_API_KEY"
```
 
Using the API is simple:

```ruby
CongressV3::Legislators.all
# => [ #<CongressV3::Legislator:0x007fa3343989b8 @chamber="house" @in_office=true> ]
```

One limitations of the Sunlight API is it has a per page limit default to 20. You can take it to the max of 50 easily though `CongressV3::Legislators.all(per_page: 50)`. You can also add query parameters to further refine your criteria `CongressV3::Legislators.all()`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CharlesMassry/CongressV3.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

