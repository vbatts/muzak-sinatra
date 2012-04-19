$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__),'lib'))

require 'rubygems'
require 'sinatra'

configure do
	root = File.expand_path(File.dirname(__FILE__))
	set :views, File.join(root,'app','views')
end

not_found do
	status 404
	erb :not_found
end

Dir["app/controllers/*.rb"].each {|file| load file }

# vim:set softtabstop=2 shiftwidth=2 et ai:
