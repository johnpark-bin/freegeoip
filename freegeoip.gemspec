# -*- encoding: utf-8 -*-
require File.expand_path('../lib/freegeoip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ezekiel Templin"]
  gem.email         = ["zeke@templ.in"]
  gem.description   = %q{Ruby Client for FreeGeoIP's geolocation API}
  gem.summary       = %q{Ruby Client for FreeGeoIP's geolocation API}
  gem.homepage      = "http://github.com/ezkl/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "freegeoip"
  gem.require_paths = ["lib"]
  gem.version       = FreeGeoIP::VERSION
  
  gem.add_runtime_dependency("faraday")
  gem.add_runtime_dependency("multi_json")
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("vcr")
end
