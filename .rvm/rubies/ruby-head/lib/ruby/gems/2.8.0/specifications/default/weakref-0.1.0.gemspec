# -*- encoding: utf-8 -*-
# stub: weakref 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "weakref".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/ruby/weakref", "source_code_uri" => "https://github.com/ruby/weakref" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yukihiro Matsumoto".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-03-05"
  s.description = "TODO: Write a longer description or delete this line.".freeze
  s.email = ["matz@ruby-lang.org".freeze]
  s.files = ["weakref.rb".freeze, "weakref/version.rb".freeze]
  s.homepage = "https://github.com/ruby/weakref".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.rubygems_version = "3.2.0.pre1".freeze
  s.summary = "TODO: Write a short summary, because RubyGems requires one.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
  end
end
