# frozen_string_literal: true

require_relative "lib/bundler/ctags_generator/version"

Gem::Specification.new do |spec|
  spec.name = "bundler-ctags_generator"
  spec.version = Bundler::CtagsGenerator::VERSION
  spec.authors = ["OKURA Masafumi"]
  spec.email = ["masafumi.o1988@gmail.com"]

  spec.summary = "Provides a hook after gem installation to generate ctags"
  spec.description = "Provides a hook after gem installation to generate ctags"
  spec.homepage = "https://github.com/okuramasafumi/bundler-ctags_generator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/okuramasafumi/bundler-ctags_generator"
  spec.metadata["changelog_uri"] = "https://github.com/okuramasafumi/bundler-ctags_generator/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 2.0"
end
