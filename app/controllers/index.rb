get '/' do
  # Look in app/views/index.erb
  erb :index
end

# Support both GET and POST for callbacks
%w(get post).each do |method|
  send(method, "/auth/:provider/callback") do
    session[params[:provider]] = env['omniauth.auth']
    Host.find_or_create_by(spotify_id: current_user.id)
    redirect '/'
  end
end

post '/playlists/new' do
  current_user.create_playlist!(params[:playlist_name])
  redirect request.referrer
end

get '/logout' do
  session.clear
  redirect '/'
end
