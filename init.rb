$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__),'lib'))

require 'yaml'

require 'rubygems'
require 'sinatra'

@root = File.expand_path(File.dirname(__FILE__))

configure do
	set :views, File.join(@root,'app','views')
        set :app_settings, if FileTest.file? File.join(@root,'config','settings.yml')
            YAML.load(File.read(File.join(@root,'config','settings.yml')))
          else
            {:music_dir => nil }
          end

end

not_found do
	status 404
	erb :not_found
end

Dir["app/controllers/*.rb"].each {|file| load file }

# vim:set softtabstop=2 shiftwidth=2 et ai:
