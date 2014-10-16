# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "activesupport-cascadestore"
  s.version     = "0.0.2"
  s.authors     = ["Jerry Cheung"]
  s.email       = ["jollyjerry@gmail.com"]
  s.homepage    = "http://github.com/jch/activesupport-cascadestore"
  s.summary     = %q{write-through cache store that allows you to chain multiple cache stores together}
  s.description = %q{write-through cache store that allows you to chain multiple cache stores together}

  s.rubyforge_project = "activesupport-cascadestore"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activesupport"
end
