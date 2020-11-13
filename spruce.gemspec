# coding: utf-8
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'spruce/version'

Gem::Specification.new do |spec|
  spec.name          = "spruce"
  spec.version       = Spruce::VERSION
  spec.authors       = ["James Dullaghan"]
  spec.email         = ["support@realvestor.io"]

  spec.summary       = %q{Wrapper for Spruce API}
  spec.description   = %q{All API endpoints wrapped in ruby}
  spec.homepage      = "https://realvestor.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">= 2.0.1", "< 3.0"
  spec.add_dependency "logger", ">= 1.4.2"

  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock", "~> 1.2"
  spec.add_development_dependency "coveralls", "~> 0.8.13"
  spec.add_development_dependency "simplecov", "~> 0.11.0"
  spec.add_development_dependency "pry"
end
