# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'travis/topaz/version'

Gem::Specification.new do |spec|
  spec.name          = "travis-topaz"
  spec.version       = Travis::Topaz::VERSION
  spec.authors       = ['Carla Drago']
  spec.email         = ['contact+travis-topaz-gem@travis-ci.org']
  spec.summary       = %q{Gem for posting event info to Travis-Topaz web app.}
  spec.description   = %q{The Travis-Topaz web app is an internal customer event-tracking insight tool.}
  spec.homepage      = "https://github.com/travis-ci/travis-topaz-gem"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "thread"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec",'~> 2.8.0'

  # Disallow pushing to rubygems
  spec.metadata['allowed_push_host'] = 'https://nonexistent-host.example.com' if spec.respond_to?(:metadata)
end
