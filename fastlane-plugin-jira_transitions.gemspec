# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/jira_transitions/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-jira_transitions'
  spec.version       = Fastlane::JiraTransitions::VERSION
  spec.author        = %q{Ostap Taran}
  spec.email         = %q{me@austinate.me}

  spec.summary       = %q{Runs transitions for specified JIRA tickets}
  spec.homepage      = "https://github.com/OMWorks/fastlane_jira_transitions"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  spec.add_dependency 'jira-ruby', '~> 1.2.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.26.1'
end
