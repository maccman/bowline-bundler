require 'pathname'
require 'logger'
require 'set'
require 'erb'
# Required elements of rubygems
require "rubygems/remote_fetcher"
require "rubygems/installer"

require "bowline/bundler/gem_bundle"
require "bowline/bundler/source"
require "bowline/bundler/finder"
require "bowline/bundler/gem_ext"
require "bowline/bundler/resolver"
require "bowline/bundler/environment"
require "bowline/bundler/dsl"
require "bowline/bundler/cli"
require "bowline/bundler/bundle"
require "bowline/bundler/dependency"
require "bowline/bundler/remote_specification"

module Bundler
  VERSION = "0.0.1"

  class << self
    attr_writer :logger

    def logger
      @logger ||= begin
        logger = Logger.new(STDOUT, Logger::INFO)
        logger.formatter = proc {|_,_,_,msg| "#{msg}\n" }
        logger
      end
    end
  end
end
