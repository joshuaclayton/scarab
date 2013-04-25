# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'scarab/version'

Gem::Specification.new do |s|
  s.name        = 'scarab'
  s.version     = Scarab::VERSION
  s.authors     = ['Joshua Clayton']
  s.email       = ['jclayton@thoughtbot.com']
  s.homepage    = ''
  s.summary     = %q{Scrabble word finder}
  s.description = %q{Scrabble word finder}

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'active_support', '>= 3.0'
  s.add_dependency 'thor'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
end
