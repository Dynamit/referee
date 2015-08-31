# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robjc/version'

robjc_spec = Gem::Specification.find_by_name('robjc')
robjc_gem_root = robjc_spec.gem_dir

Gem::Specification.new do |spec|
  spec.name          = 'robjc'
  spec.version       = RObjc::VERSION
  spec.authors       = ['Colin Drake']
  spec.email         = ['colin.f.drake@gmail.com']

  spec.summary       = 'Resource file generator for Objective-C.'
  spec.description   = 'Resource file generator for Objective-C. Parses Xcode projects and' \
                       'creates a .m/.h file of compile-time checked resources.'
  spec.homepage      = 'http://dynamit.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.33.0'
  spec.add_development_dependency 'pry', '~> 0.10.1'

  spec.add_dependency 'xcodeproj', '~> 0.20.1'
  spec.add_runtime_dependency 'mustache', '~> 1.0', '>= 1.0.2'
  spec.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.6.2'
  post_install { `ln -s /usr/local/bin/robjc #{robjc_gem_root}/bin/robjc` }
  post_uninstall { `rm /usr/local/bin/robjc` }
end
