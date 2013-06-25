# -*- encoding: utf-8 -*-

require File.expand_path('../lib/weighted_shuffle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "weighted_shuffle"
  gem.version       = WeightedShuffle::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Frank C. Eckert"]
  gem.email         = "frank.eckert@boost-project.com"
  gem.homepage      = "https://rubygems.org/gems/weighted_shuffle"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
