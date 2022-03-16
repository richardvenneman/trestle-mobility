
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trestle/mobility/version"

Gem::Specification.new do |spec|
  spec.name          = "trestle-mobility"
  spec.version       = Trestle::Mobility::VERSION
  spec.authors       = ["Richard Venneman"]
  spec.email         = ["richardvenneman@me.com"]
  spec.license       = "MIT"

  spec.summary       = %q{Mobility integration plugin for the Trestle admin framework}
  spec.description   = %q{Mobility integration plugin for the Trestle admin framework}
  spec.homepage      = "https://github.com/richardvenneman/trestle-mobility"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "emoji_flag", "~> 0.1"
  spec.add_dependency "mobility", ">= 0.8"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
