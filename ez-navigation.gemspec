# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ez/navigation/version"

Gem::Specification.new do |s|
  s.name        = "ez-navigation"
  s.version     = Ez::Navigation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Hancock"]
  s.email       = ["stevenh512@gmail.com"]
  s.homepage    = "https://github.com/stevenh512/ez-navigation"
  s.summary     = %q{Simple pure CSS drop-down navigation menus for Rails 3}
  s.description = %q{Simple pure CSS drop-down navigation menus for Rails 3}

  s.rubyforge_project = "ez-navigation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.licenses = ['MIT']

  s.add_dependency 'rails', ['~> 3.0']
  s.add_development_dependency 'bundler', ['>= 1.0.0']
end

