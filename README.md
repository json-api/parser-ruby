# JSON::Api

[![Build Status](https://travis-ci.org/json-api/parser-ruby.png)](https://travis-ci.org/json-api/parser-ruby) [![Code Climate](https://codeclimate.com/github/json-api/parser-ruby.png)](https://codeclimate.com/github/json-api/parser-ruby)

A parser and validator for [JSON API](http://jsonapi.org) documents.

## Installation

Add this line to your application's Gemfile:

    gem 'json-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json-api

## Usage

```ruby
require 'json/api'

json = <<-JSON
{
  "posts": [{
    "id": "1",
    "title": "Rails is Omakase",
    "links": {
      "author": "9",
      "comments": [ "5", "12", "17", "20" ]
    }
  }]
}
JSON

puts JSON::Api.parse(json).class # => Hash
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
