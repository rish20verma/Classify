# frozen_string_literal: true

require_relative "lib/classify/version"

Gem::Specification.new do |s|
  s.name        = "classify"
  s.version     = "0.0.0"
  s.summary     = "classify!"
  s.description = "A simple hello world gem"
  s.authors     = ["test name"]
  s.email       = "test@asas.to"
  s.files       = ["lib/*"]
  s.homepage    =
    "https://rubygems.org/gems/"
  s.license       = "TEST"
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_development_dependency "rake"
  s.add_development_dependency 'rspec-rails', '~> 4.0'
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
end
