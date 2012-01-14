# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yodaism/version"

Gem::Specification.new do |s|
  s.name        = "yodaism"
  s.version     = Yodaism::VERSION
  s.authors     = ["willywos"]
  s.email       = ["wwilimek@gmail.com"]
  s.homepage    = "http://www.github.com/willywos"
  s.summary     = %q{Yodaism is about all things Yoda}
  s.description = %q{Ever need a quick quote from Yoda?
                     Maybe you just need him to give you some quick advice.
                    Yodaism is a collection of quotes and some ascii porn to get your Yoda fix.}

  s.rubyforge_project = "yodaism"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  
  s.executables = ["yodaism"]
  s.default_executable = 'yodaism'
  s.add_development_dependency "rake"
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
