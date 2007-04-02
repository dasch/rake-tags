
require 'rake'
require 'rake/tasklib'

class RTagsTask < Rake::TaskLib
  attr_accessor :name, :rtags_dir, :tagfile, :vi, :quiet

  def initialize(name = :tags)
    @name, @rtags_dir = name, %w[lib test]
    @vi, @quiet = true, true

    yield self if block_given?

    @tagfile ||= vi ? 'tags' : 'TAGS'

    desc "Build the tags file used by #{vi ? 'vi' : 'emacs'}"
    task @name do
      cmd  = "rtags"
      cmd << ' --quiet' if quiet
      cmd << ' --vi' if vi
      cmd << " -f #{tagfile}"
      cmd << " -R #{rtags_dir.join(' ')}"

      sh cmd

      puts
    end

    task :default => @name

    desc 'Remove rtags products'
    task "clobber_#{@name}" do
      rm_f @tagfile
    end

    task :clobber => :"clobber_#{@name}"
  end
end
