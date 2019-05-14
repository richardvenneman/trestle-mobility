module Trestle
  module Mobility
    class Engine < Rails::Engine
      config.assets.precompile << "trestle/mobility.css" << "trestle/mobility.js"
    end
  end
end
