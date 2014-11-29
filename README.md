# Rails Reverse DB [![Gem Version](https://badge.fury.io/rb/rails_reverse_db.png)](http://badge.fury.io/rb/rails_reverse_db) [![Build Status](https://secure.travis-ci.org/cmckni3/rails_reverse_db.png)](http://travis-ci.org/cmckni3/rails_reverse_db) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/cmckni3/rails_reverse_db)

Gem for reverse engineering an existing database using ActiveRecord

Runs the rails scaffolding command with the appropriate arguments
to generate models, controllers, tests, etc from an existing database

## Installation

    gem 'rails_reverse_db'

## Usage

`bundle exec rake reverse_engineer OPTIONS` OR `rake reverse_engineer OPTIONS`
    
By default this will run `rails generate scaffold TableName column:string`

## Copyright

Copyright (c) 2012-2013 Chris McKnight and [Anthony Heukmes](https://github.com/ahe/) (2009-2013). Licensed under the MIT License

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thanks

Inspired by and uses a little modified code from [Anthony Heukmes](https://github.com/ahe/) [Reverse Scaffold Script](https://github.com/ahe/reverse_scaffold)
