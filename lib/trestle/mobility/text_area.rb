module Trestle
  module Mobility
    class TextArea < Trestle::Form::Field
      def field
        instance = builder.object
        locales = options[:locales] || I18n.available_locales.sort
        rows = options[:rows] || 5

        @template.render partial: "trestle/mobility/text_area",
                         locals: { field_name: name, locales: locales, rows: rows }
      end
    end
  end
end
