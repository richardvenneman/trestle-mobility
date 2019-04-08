module Trestle
  module Mobility
    class TextField < Trestle::Form::Field
      def field
        instance = builder.object
        locales = options[:locales] || I18n.available_locales.sort

        @template.render partial: "trestle/mobility/text_field",
                         locals: { field_name: name, locales: locales }
      end
    end
  end
end
