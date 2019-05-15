module Trestle
  module Mobility
    module Fields
      class TextArea < Trestle::Form::Field
        def field
          label = options[:label] || name.to_s.humanize
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected || locales.first
          rows = options[:rows] || 5

          @template.render partial: "trestle/mobility/text_area",
                           locals: {
                             field_name: name,
                             label: label,
                             locales: locales,
                             selected: selected,
                             rows: rows
                           }
        end
      end
    end
  end
end
