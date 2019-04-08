# Trestle Mobility Integration (trestle-mobility)

> [Mobility](https://github.com/shioyama/mobility) integration plugin for the [Trestle admin framework](https://trestle.io)

[![Gem](https://img.shields.io/gem/v/trestle-mobility.svg)](https://rubygems.org/gems/trestle-mobility)

## Features / problems

- [ ] Manage Mobility translations with a tabbed interface in trestle
- [ ] Supports Postgres container back-end
- [ ] Probably works with other back-ends but has not been tested

## Usage

Trestle Mobility requires you to enable [Mobility's `locale_accessors` plugin](https://github.com/shioyama/mobility#getset) to be enabled.

Assuming you've setup your models with Mobility's `translates` directives, you can use the `mobility_text_field` and `mobility_text_area` field types:

```ruby
Trestle.resource(:posts) do
  form do |user|
    mobility_text_field :title
    mobility_text_field :subtitle
    mobility_text_area :content
  end
end
```

## Installation

These instructions assume you have a working Trestle application. To integrate trestle-mobility, first add it to your application's Gemfile:

```ruby
gem 'trestle-mobility'
```

Run `bundle install`, and then restart your Rails server.

## License

The gem is available as open source under the terms of the [Blue Oak Model License](https://blueoakcouncil.org/license/1.0.0).
