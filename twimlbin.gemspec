# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "twimlbin"
  s.version     = "0.0.1"
  s.authors     = ["Kentaro Yoshida"]
  s.email       = ["y.ken.studio@gmail.com"]
  s.homepage    = "https://github.com/y-ken/twimlbin"
  s.summary     = %q{twimlbin wrapper class. you can use twimlbin to host twilio markup language without a own server.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
end
