require "trestle/mobility/check_box"
require "trestle/mobility/text_area"
require "trestle/mobility/text_field"

Trestle.configure do |config|
  config.hook(:stylesheets) do
    stylesheet_link_tag "trestle/mobility"
  end

  config.hook(:javascripts) do
    javascript_include_tag "trestle/mobility_fields.js"
  end

  config.form_field :mobility_check_box, Trestle::Mobility::CheckBox
  config.form_field :mobility_text_area, Trestle::Mobility::TextArea
  config.form_field :mobility_text_field, Trestle::Mobility::TextField
end
