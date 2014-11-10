# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whiz_client/version'

Gem::Specification.new do |spec|
  spec.name          = "whiz_client"
  spec.version       = WhizClient::VERSION
  spec.authors       = ["Chiranjib Roy"]
  spec.email         = ["raychiranjib1@gmail.com"]
  spec.summary       = %q{A client program for WhizApi}
  spec.description   = %q{It is wrapper to get access of WhizApi Service like Indian State, City, STD code and various api created by WhizApi.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.rubyforge_project = 'whiz_client'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client', ">=1.7.2"
  spec.add_dependency 'json', ">=1.8.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 2.13.0'
  spec.add_development_dependency "webmock", '1.16.1'
end
