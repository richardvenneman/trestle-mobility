# frozen_string_literal: true

module Trestle::Mobility::Translators
  class DeeplTranslator
    def initialize(*)
      begin
        require "deepl"
      rescue LoadError
        raise StandardError, "Add the 'deepl-rb' gem to your Gemfile"
      end

      configure_api_key!
    end

    def translate(text, from, to, query_params = {})
      DeepL.translate(text, from, to, query_params)
    end

    private
      def configure_api_key!
        DeepL.configure do |config|
          config.auth_key = Trestle.config.mobility.deepl_api_key
        end
      end
  end
end
