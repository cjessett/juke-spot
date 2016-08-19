# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'omniauth-spotify'

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions

  use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET']

  scopes = "user-read-email user-read-private playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private"

  use OmniAuth::Builder do
    provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: scopes
  end

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
