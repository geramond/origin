baseruby="echo executable host ruby is required.  use --with-baseruby option.; false"
_\
=begin
_=
ruby="${RUBY-$baseruby}"
case "$ruby" in "echo "*) $ruby; exit $?;; esac
case "$0" in /*) r=-r"$0";; *) r=-r"./$0";; esac
exec $ruby "$r" "$@"
=end
=baseruby
class Object
  remove_const :CROSS_COMPILING if defined?(CROSS_COMPILING)
  CROSS_COMPILING = RUBY_PLATFORM
  constants.grep(/^RUBY_/) {|n| remove_const n}
  RUBY_VERSION = "2.7.0"
  RUBY_RELEASE_DATE = "2019-05-31"
  RUBY_PLATFORM = "x86_64-linux"
  RUBY_PATCHLEVEL = -1
  RUBY_REVISION = "c55db6aa271df4a689dc8eb0039c929bf6ed43ff"
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2019 Yukihiro Matsumoto"
  RUBY_ENGINE = "ruby"
  RUBY_ENGINE_VERSION = "2.7.0"
  RUBY_DESCRIPTION = RubyVM.const_defined?(:MJIT) && RubyVM::MJIT.enabled? ?
    "ruby 2.7.0preview1 (2019-05-31 trunk c55db6aa271df4a689dc8eb0039c929bf6ed43ff) +JIT [x86_64-linux]" :
    "ruby 2.7.0preview1 (2019-05-31 trunk c55db6aa271df4a689dc8eb0039c929bf6ed43ff) [x86_64-linux]"
end
builddir = File.dirname(File.expand_path(__FILE__))
srcdir = "."
top_srcdir = File.realpath(srcdir, builddir)
fake = File.join(top_srcdir, "tool/fake.rb")
eval(File.binread(fake), nil, fake)
ropt = "-r#{__FILE__}"
["RUBYOPT"].each do |flag|
  opt = ENV[flag]
  opt = opt ? ([ropt] | opt.b.split(/\s+/)).join(" ") : ropt
  ENV[flag] = opt
end
