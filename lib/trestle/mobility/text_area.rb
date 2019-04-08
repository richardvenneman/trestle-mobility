module Trestle
  module Mobility
    class TextArea < Trestle::Form::Field
      def field
        instance = builder.object
        locales = instance.translations.keys

        @template.render partial: "trestle/mobility/text_area",
                         locals: { field_name: name, locales: locales }
      end
    end
  end
end
