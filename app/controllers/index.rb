get '/' do
  # Look in app/views/index.erb
  erb :index
end

# Support both GET and POST for callbacks
%w(get post).each do |method|
  send(method, "/auth/:provider/callback") do
    # env['omniauth.auth'] # => OmniAuth::AuthHash
    @spotify_user = RSpotify::User.new env['omniauth.auth']
    redirect '/'
  end
end
