module Trestle
  module Mobility
    module Fields
      class TextField < Trestle::Form::Field
        def field
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected || locales.first

          @template.render partial: "trestle/mobility/text_field",
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
