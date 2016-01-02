# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trakt/version'

Gem::Specification.new do |gem|
  gem.name          = "trakt"
  gem.version       = Trakt::VERSION
  gem.authors       = ["Daniel Bretoi"]
  gem.email         = ["daniel@bretoi.com"]
  gem.description   = %q{API for trakt.tv service}
  gem.summary       = %q{API for trakt.tv service}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_dependency "excon"
end
