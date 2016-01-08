# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rooftop/events/version'

Gem::Specification.new do |spec|
  spec.name          = "rooftop-events"
  spec.version       = Rooftop::Events::VERSION
  spec.authors       = ["Ed Jones", "Paul Hendrick"]
  spec.email         = ["hosting@error.agency"]

  spec.summary       = %q{A library to interact with Rooftop CMS event posts}
  spec.description   = %q{A library to interact with Rooftop CMS event posts}
  spec.homepage      = "https://github.com/rooftopcms/rooftop-ruby-events"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rooftop"
end
