# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pigi/version'

Gem::Specification.new do |spec|
  spec.name          = "pigi"
  spec.version       = Pigi::VERSION
  spec.authors       = ["Aleksander Grzyb"]
  spec.email         = ["aleksander.grzyb@gmail.com"]
  spec.summary       = "Command line tool that automatically adds Pivotal Tracker story ID into your commit message."
  spec.description   = "Command line tool that automatically adds Pivotal Tracker story ID into your commit message."
  spec.homepage      = "https://github.com/aleksandergrzyb/PivotalGithubHelper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["pigi"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "thor"
end
