# CamelUpCalculator

NOT YET WORKING (almost :D)

This is a gem that calculates the odds for a round of CamelUp (CamelCup).
It calculates the odds by running through every possible outcome and then
uses the results to determine the odds for a given camel winning.

For example: In 1000 possible outcomes Yellow placed 1st 100 times then
yellow will have a 10% chance of winning as every possible outcome is as
likely as anyother single possible outcome.

This calculation is given for each camel and for each position.  This means
it is possible to determine the odds for any camel finishing in any position.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'camel_up_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install camel_up_calculator

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/camel_up_calculator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CamelUpCalculator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/camel_up_calculator/blob/master/CODE_OF_CONDUCT.md).
