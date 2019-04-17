module Trestle
  module Mobility
    class Engine < Rails::Engine
      config.assets.precompile << 'trestle/mobility_fields.js'
    end
  end
end
