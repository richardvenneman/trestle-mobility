module Trestle
  module Mobility
    module Fields
      class TextField < Trestle::Form::Field
        def field
          label = options[:label] || name.to_s.humanize
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected.call || locales.first
          deepl_query_params =  options[:deepl_query_params] || {}

          @template.render partial: "trestle/mobility/text_field",
                           locals: {
                             options: options,
                             field_name: name,
                             label: label,
                             locales: locales,
                             selected: selected,
                             deepl_query_params: deepl_query_params
                           }
        end
      end
    end
  end
end
