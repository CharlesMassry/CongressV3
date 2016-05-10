# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'congress_v3/version'

Gem::Specification.new do |spec|
  spec.name          = "congress_v3"
  spec.version       = CongressV3::VERSION
  spec.authors       = ["charlesmassry"]
  spec.email         = ["me@charliemassry.com"]
  spec.platform      = Gem::Platform::RUBY
  spec.summary       = "Ruby wrapper for accessing the Congress V3 API"
  spec.description   = "The Congress V3 API requires an API key which you can get at http://sunlightfoundation.com/api/accounts/register/"
  spec.homepage      = "https://github.com/CharlesMassry/CongressV3"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.7"
  spec.add_dependency "open_uri_redirections"

  spec.add_development_dependency "bundler", "~> 1.12.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
  spec.add_development_dependency "vcr", "~> 3.0.0"
  spec.add_development_dependency "dotenv", "~> 2.1.0"
  spec.add_development_dependency "webmock", "~> 1.24.0"
  spec.add_development_dependency "coveralls", "0.8.0"
end
