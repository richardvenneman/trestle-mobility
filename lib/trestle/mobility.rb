require "emoji_flag"

require "trestle"
require "trestle/mobility/version"
require "trestle/mobility/configuration"
require "trestle/mobility/translators/deepl_translator"
require "trestle/mobility/engine" if defined?(Rails)

Trestle::Configuration.option :mobility, Trestle::Mobility::Configuration.new
