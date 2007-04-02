
require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
#require 'rtagstask'

require 'lib/rtagstask/version'

Rake::TestTask.new(:test)

Rake::RDocTask.new(:docs)

spec = Gem::Specification.new do |s|
  s.name       = 'rtagstask'
  s.version    = RTagsTask::VERSION
  s.author     = 'Daniel Schierbeck'
  s.summary    = 'A Rake task for building vi and emacs tags'
  s.files      = FileList['lib/**/*.rb']
  s.test_files = FileList['test/**/test*.rb']

  s.add_dependency('rtags')
end

Rake::GemPackageTask.new(spec) do |t|
  t.need_tar = true
end

#RTagsTask.new

desc 'Install as gem'
task :install_gem do
  sh 'sudo gem install pkg/rtagstask'
end

task :install_gem => :package
