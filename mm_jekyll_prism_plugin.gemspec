# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "mm-jekyll-prism"
  spec.version       = "0.0.2"
  spec.authors       = ["Tim Oram"]
  spec.email         = ["mitmaro@gmail.com"]
  spec.summary       = %q{Prism plugin for Jekyll}
  spec.description   = %q{Provides support for prisim in Jekyll, including plugin support.}
  spec.homepage      = "https://github.com/mitmaro/jekyll-prism-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "jekyll", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.0"

end
