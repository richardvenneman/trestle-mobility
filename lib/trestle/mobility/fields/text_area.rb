module Trestle
  module Mobility
    module Fields
      class TextArea < Trestle::Form::Field
        def field
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected || locales.first
          rows = options[:rows] || 5

          @template.render partial: "trestle/mobility/text_area",
                           locals: {
                             field_name: name,
                             locales: locales,
                             selected: selected,
                             rows: rows
                           }
        end
      end
    end
  end
end
