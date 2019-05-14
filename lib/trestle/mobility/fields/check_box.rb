module Trestle
  module Mobility
    module Fields
      class CheckBox < Trestle::Form::Fields::CheckBox
        def field
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected || locales.first

          @template.render partial: "trestle/mobility/check_box",
                           locals: {
                             field_name: name,
                             locales: locales,
                             selected: selected
                           }
        end
      end
    end
  end
end
