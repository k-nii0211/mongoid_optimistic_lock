# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/optimistic_lock/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid_optimistic_lock"
  spec.platform      = Gem::Platform::RUBY
  spec.version       = Mongoid::OptimisticLock::VERSION
  spec.authors       = ["nii_kenichi"]
  spec.email         = ["kenichi@guucy.com"]

  spec.summary       = %q{mongoid_optimistic_lock supports simple optimistic lock.}
  spec.description   = %q{mongoid_optimistic_lock supports simple optimistic lock.}
  spec.homepage      = 'https://bitbucket.org/guucy/mongoid_optimistic_lock'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mongoid", "~> 4.0", "< 5"

  spec.add_development_dependency "rspec"
end
