# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "activerecord_cache_store"
  s.version     = "0.0.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tomasz Mazur"]
  s.email       = ["defkode@gmail.com"]
  s.homepage    = "https://github.com/defkode/activerecord_cache_store"
  s.summary     = %q{ActiveRecord Cache Store for Rails 3}
  s.description = %q{stores cache in database}

  s.rubyforge_project = "activerecord_cache_store"
  s.add_dependency("activerecord", ">= 3.0.0")
  s.add_dependency("activesupport", ">= 3.0.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
