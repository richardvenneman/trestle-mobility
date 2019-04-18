# Trestle Mobility Integration (trestle-mobility)

> [Mobility](https://github.com/shioyama/mobility) integration plugin for the [Trestle admin framework](https://trestle.io)

[![Gem](https://img.shields.io/gem/v/trestle-mobility.svg)](https://rubygems.org/gems/trestle-mobility)

## Features / problems

- Manage Mobility translations with a space-efficient dropdown interface in Trestle
- Developed for usage with Mobility's Postgres container back-end
- Probably works with other back-ends but has not been tested

<img src="/screenshot.png?raw=true" width="529" height="242" alt="Trestle Mobility screenshot" />

## Usage

Trestle Mobility requires you to enable [Mobility's `locale_accessors` plugin](https://github.com/shioyama/mobility#getset).

Assuming you've setup your models with Mobility's `translates` directives, you can use the `mobility_text_field` and `mobility_text_area` field types:

```ruby
Trestle.resource(:posts) do
  form do |post|
    mobility_text_field :title
    mobility_text_field :subtitle
    mobility_text_area :content
  end
end
```

### Specifying locales

By default Trestle Mobility uses `I18n.available_locales` to generate the form fields, but you can specify this on a per-field basis:

```ruby
mobility_text_field :title, locales: %w(nl de fr)
```

Quoting Mobility's README:

> (Note however that Mobility will complain if you have I18n.enforce_available_locales set to true and you try accessing a locale not present in I18n.available_locales; set it to false if you want to allow any locale.)

### Default language selection

Trestle Mobility allows you to specify the language that is selected by default. This is possible on an application-wide basis but also per field.

To set the default language that should be selected for all fields, add the following line to your Trestle initializer:

```ruby
config.mobility.selected = "nl"
```

Or specify it per field:

```ruby
mobility_text_field :subtitle, selected: "nl"
```

## Installation

These instructions assume you have a working Trestle application. To integrate trestle-mobility, first add it to your application's Gemfile:

```ruby
gem 'trestle-mobility'
```

Run `bundle install`, and then restart your Rails server.
