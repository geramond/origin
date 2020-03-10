# -*- encoding: utf-8 -*-
# stub: reline 0.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "reline".freeze
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["aycabta".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-03-05"
  s.description = "Alternative GNU Readline or Editline implementation by pure Ruby.".freeze
  s.email = ["aycabta@gmail.com".freeze]
  s.files = ["reline.rb".freeze, "reline/ansi.rb".freeze, "reline/config.rb".freeze, "reline/general_io.rb".freeze, "reline/key_actor.rb".freeze, "reline/key_actor/base.rb".freeze, "reline/key_actor/emacs.rb".freeze, "reline/key_actor/vi_command.rb".freeze, "reline/key_actor/vi_insert.rb".freeze, "reline/key_stroke.rb".freeze, "reline/kill_ring.rb".freeze, "reline/line_editor.rb".freeze, "reline/unicode.rb".freeze, "reline/unicode/east_asian_width.rb".freeze, "reline/version.rb".freeze, "reline/windows.rb".freeze]
  s.homepage = "https://github.com/ruby/reline".freeze
  s.licenses = ["Ruby License".freeze]
  s.rubygems_version = "3.1.0.pre1".freeze
  s.summary = "Alternative GNU Readline or Editline implementation by pure Ruby.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
