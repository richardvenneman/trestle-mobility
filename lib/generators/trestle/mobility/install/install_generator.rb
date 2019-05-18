module Trestle
  module Mobility
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Installs trestle-mobility"

        def check_trestle_installed
          unless ::File.exist?("config/initializers/trestle.rb")
            raise Thor::Error, "The file config/initializers/trestle.rb does not appear to exist. Please run `trestle:install` first."
          end
        end

        def insert_configuration
          inject_into_file "config/initializers/trestle.rb", before: /^end/ do
            <<-RUBY.strip_heredoc.indent(2)

              # == Mobility Options
              #
              # Specify the default selected locale
              #
              # config.mobility.selected = -> { I18n.locale }

              # Specify your DeepL Pro API key to easily translate values
              #
              # config.mobility.deepl_api_key = "YOUR-API-KEY"
            RUBY
          end
        end
      end
    end
  end
end
