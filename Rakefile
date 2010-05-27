$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'bowline/bundler'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "bowline-bundler"
    gemspec.summary = "An easy way to vendor gem dependencies for Bowline apps"
    gemspec.email = "alex@leadthinking.com"
    gemspec.homepage = "http://github.com/maccman/bowline-bundler"
    gemspec.authors = ["Alex MacCaw"]
    gemspec.required_rubygems_version = ">= 1.3.5"
    gemspec.files = FileList["[A-Z]*", "{bin,generators,lib,spec}/**/*"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

task :default => :spec

begin
  require 'spec/rake/spectask'
rescue LoadError
  task(:spec) { $stderr.puts '`gem install rspec` to run specs' }
else
  desc "Run specs"
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['spec/**/*_spec.rb'] - FileList['spec/fixtures/**/*_spec.rb']
    t.spec_opts = %w(-fs --color)
    t.warning = true
  end
end

namespace :spec do
  file "tmp/rg_deps" do
    repo = File.dirname(__FILE__) + '/tmp/rg_deps'
    FileUtils.mkdir_p(repo)
    p repo
    ENV['GEM_HOME'], ENV['GEM_PATH'] = repo, repo
    system "gem install builder --no-rdoc --no-ri"
  end

  desc "Do all setup needed to run the specs"
  task :setup => "tmp/rg_deps"
end
