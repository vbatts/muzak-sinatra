$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << '.'

require 'init'

set :run, false
set :environment, :production

run Sinatra::Application

