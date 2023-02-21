# frozen_string_literal: true

require_relative "ctags_generator/version"

module Bundler
  # This module are responsible to generate ctags file.
  module CtagsGenerator
    class Error < StandardError; end

    def self.run
      generate_tags_for_stdlib
      generate_tags_for_bundler
    end

    def self.execute_ctags(filename, path)
      cmd = "ctags --exclude='spec/*' --exclude='test/*' --exclude='**/node_modules/**/*' -f '#{filename}' --languages=ruby -R #{path}"
      system(cmd)
    end

    def self.generate_tags_for_stdlib
      stdlib_paths = Dir.glob("#{RbConfig::CONFIG["rubylibdir"]}/**/*.rb}")
      paths = stdlib_paths.join(" ").strip
      execute_ctags("stdlibs.tags", paths)
    end

    def self.generate_tags_for_bundler
      bundle_paths = `bundle show --paths`
      paths = bundle_paths.split("\n")
      path = paths.map { _1 << "/lib" }.join(" ").strip
      execute_ctags("gems.tags", path)
    end
  end
end
