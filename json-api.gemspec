# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json/api/version'

Gem::Specification.new do |spec|
  spec.name          = "json-api"
  spec.version       = JSON::Api::VERSION
  spec.authors       = ["Steve Klabnik"]
  spec.email         = ["steve@steveklabnik.com"]
  spec.description   = %q{A JSON API parser.}
  spec.summary       = %q{A JSON API parser.}
  spec.homepage      = "http://jsonapi.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "json-schema"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
