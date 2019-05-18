module Trestle
  module Mobility
    class Configuration
      include Configurable

      option :selected, -> { I18n.locale }, evaluate: false
      option :deepl_api_key
    end
  end
end
