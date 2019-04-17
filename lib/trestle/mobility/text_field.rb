module Trestle
  module Mobility
    class TextField < Trestle::Form::Field
      def field
        instance = builder.object
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
