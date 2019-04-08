require "trestle/mobility/text_area"
require "trestle/mobility/text_field"

Trestle.configure do |config|
  config.form_field :mobility_text_area, Trestle::Mobility::TextArea
  config.form_field :mobility_text_field, Trestle::Mobility::TextField
end
