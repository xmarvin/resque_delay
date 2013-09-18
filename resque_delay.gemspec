# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque_delay/version'

Gem::Specification.new do |spec|
  spec.name          = "resque_delay"
  spec.version       = ResqueDelay::VERSION
  spec.authors       = ["Alexey Kisel"]
  spec.email         = ["aki@jetthoughts.com"]
  spec.description = spec.summary       = 'Allow execute methods in background without adding new jobs. Like .delay method in DelayedJob'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "resque"
end
