# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'omniauth-spotify'

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  use Rack::Session::Cookie

  use OmniAuth::Builder do
    provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: "user-read-email user-read-private playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private"
  end

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
