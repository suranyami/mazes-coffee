require 'bundler'

require 'middleman-core/load_paths'
::Middleman.setup_load_paths

require 'middleman-core'
require 'middleman-core/application'
server = ::Middleman::Application.server
run server  
