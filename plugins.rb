require 'bundler/ctags_generator'

Bundler::Plugin.add_hook('after-install-all') do |dependencies|
  Bundler::CtagsGenerator.run
end
