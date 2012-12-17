# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-hostruby/version'

Gem::Specification.new do |gem|
  gem.name          = "vagrant-hostruby"
  gem.version       = Vagrant::Hostruby::VERSION
  gem.authors       = ["Chris Berkhout"]
  gem.email         = ["chrisberkhout@gmail.com"]
  gem.description   = %q{Provision Vagrant boxes with Ruby (on the host machine)}
  gem.summary       = %q{Provision Vagrant boxes with Ruby (on the host machine)}
  gem.homepage      = "https://github.com/chrisberkhout/vagrant-hostruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

