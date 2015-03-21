# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'educatea/version'

Gem::Specification.new do |spec|
  spec.name          = "educatea"
  spec.version       = Educatea::VERSION
  spec.authors       = ["Juan Gesino"]
  spec.email         = ["juangesino@gmail.com"]
  spec.summary       = "Use Educatea's API"
  spec.description   = "Ruby Gem to make using Educatea's API much easier"
  spec.homepage      = "http://educatea.com.ar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
