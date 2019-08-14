module Trestle
  module Mobility
    module Fields
      class CheckBox < Trestle::Form::Fields::CheckBox
        def field
          label = options[:label] || name.to_s.humanize
          locales = options[:locales] || I18n.available_locales.sort
          selected = options[:selected] || Trestle.config.mobility.selected.call || locales.first

          @template.render partial: "trestle/mobility/check_box",
                           locals: {
                             builder: builder,
                             field_name: name,
                             label: label,
                             locales: locales,
                             selected: selected
                           }
        end
      end
    end
  end
end
