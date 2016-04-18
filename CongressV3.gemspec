# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'CongressV3/version'

Gem::Specification.new do |spec|
  spec.name          = "CongressV3"
  spec.version       = CongressV3::VERSION
  spec.authors       = ["charlesmassry"]
  spec.email         = ["me@charliemassry.com"]

  spec.summary       = "Ruby wrapper for accessing the Congress V3 API"
  spec.description   = "The Congress V3 API requires an API key which you can get at http://sunlightfoundation.com/api/accounts/register/"
  spec.homepage      = "https://github.com/CharlesMassry/CongressV3"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.7"

  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
  spec.add_development_dependency "vcr", "~> 3.0.0"
  spec.add_development_dependency "dotenv", "~> 2.1.0"
  spec.add_development_dependency "webmock", "~> 1.24.0"
  spec.add_development_dependency "coveralls", "0.8.0"
end
