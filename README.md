# Trestle Mobility Integration (trestle-mobility)

> [Mobility](https://github.com/shioyama/mobility) integration plugin for the [Trestle admin framework](https://trestle.io)

[![Gem](https://img.shields.io/gem/v/trestle-mobility.svg)](https://rubygems.org/gems/trestle-mobility)

## Features / problems

- Manage Mobility translations with a space-efficient dropdown interface in Trestle
- Supports text fields, text area's and check boxes
- Integrates with [DeepL Pro](https://www.deepl.com/pro.html) to automatically translate fields

<img src="/screenshot.png?raw=true" width="529" height="242" alt="Trestle Mobility screenshot" />

## Getting started

These instructions assume you have a working Trestle application. To integrate trestle-mobility, first add it to your application's Gemfile:

```ruby
gem 'trestle-mobility'
```

Run `bundle install`, and then run the install generator to set up configuration options.

    $ rails generate trestle:mobility:install

## Usage

Trestle Mobility requires you to enable [Mobility's `locale_accessors` plugin](https://github.com/shioyama/mobility#getset).

Assuming you've setup your models with Mobility's `translates` directives, you can use the `mobility_text_field`, `mobility_text_area` and `mobility_check_box` field types:

```ruby
Trestle.resource(:posts) do
  form do |post|
    mobility_text_field :title
    mobility_text_field :subtitle
    mobility_text_area :content
    mobility_check_box :published
  end
end
```

Trestle Mobility allows you to specify the language that is selected by default:

```ruby
mobility_text_field :subtitle, selected: "nl"
```

By default Trestle Mobility uses `I18n.available_locales` to generate the form fields, but you can specify the languages on a per-field basis:

```ruby
mobility_text_field :title, locales: %w(nl de fr)
```

Quoting Mobility's README:

> (Note however that Mobility will complain if you have I18n.enforce_available_locales set to true and you try accessing a locale not present in I18n.available_locales; set it to false if you want to allow any locale.)

## DeepL translation

<img src="/screenshot-deepl.png?raw=true" width="410" height="241" alt="Trestle Mobility DeepL integration screenshot" />

Trestle Mobility can automatically populate empty field values with translations from other languages. This functionality is powered by the excellent [deepl-rb](https://github.com/wikiti/deepl-rb) gem. To make use of this, add `deepl-rb` to your Gemfile and specify your DeepL Pro API key in your Trestle initializer:

```ruby
config.mobility.deepl_api_key = "YOUR-API-KEY"
```

It is possible to pass any DeepL API options to the field (check out the [deepl-rb documentation](https://github.com/wikiti/deepl-rb#translate) section on params):

```ruby
mobility_text_area :content, rows: 14, deepl_query_params: { tag_handling: "xml" }
```
