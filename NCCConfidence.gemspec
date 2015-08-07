# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nccconfidence/version'

Gem::Specification.new do |spec|
  spec.name          = "NCCConfidence"
  spec.version       = NCCConfidence::VERSION
  spec.authors       = ["Thermatix"]
  spec.email         = ["mbeckerwork@gmail.com"]

  spec.summary       = %q{This is a gem to make queries to NCC Site confidence API}
  spec.homepage      = "https://github.com/Thermatix/NCCConfidence_API"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "addressable" , "2.3.8"
  spec.add_runtime_dependency "curb"        , "0.8.8"
  spec.add_runtime_dependency "json"        , "1.8.3"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
