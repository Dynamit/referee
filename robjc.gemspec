# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robjc/version'

Gem::Specification.new do |spec|
  spec.name          = "robjc"
  spec.version       = RObjc::VERSION
  spec.authors       = ["Colin Drake"]
  spec.email         = ["colin.f.drake@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Resource file generator for Objective-C.}
  spec.description   = %q{Resource file generator for Objective-C. Parses Xcode projects and creates a .m/.h file of compile-time checked resources.}
  spec.homepage      = "http://dynamit.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", "~> 0.33.0"
  spec.add_development_dependency "pry", "~> 0.10.1"

  spec.add_dependency "mustache", "~> 1.0.2"
  spec.add_dependency "nokogiri", "~> 1.6.6.2"
  spec.add_dependency "xcodeproj", "~> 0.20.1"
end
