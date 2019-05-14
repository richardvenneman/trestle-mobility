require "trestle/mobility/fields/check_box"
require "trestle/mobility/fields/text_area"
require "trestle/mobility/fields/text_field"

Trestle.configure do |config|
  config.hook(:stylesheets) { stylesheet_link_tag "trestle/mobility" }
  config.hook(:javascripts) { javascript_include_tag "trestle/mobility" }

  config.form_field :mobility_check_box, Trestle::Mobility::Fields::CheckBox
  config.form_field :mobility_text_area, Trestle::Mobility::Fields::TextArea
  config.form_field :mobility_text_field, Trestle::Mobility::Fields::TextField
end
