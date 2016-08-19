get '/' do
  # Look in app/views/index.erb
  erb :index
end

# Support both GET and POST for callbacks
%w(get post).each do |method|
  send(method, "/auth/:provider/callback") do
    # env['omniauth.auth'] # => OmniAuth::AuthHash
    session[params[:provider]] = env['omniauth.auth']
    erb :index
  end
end

get '/new_playlist' do
  current_user.create_playlist!('juke-spot-new' + Time.now.strftime("%D-%H:%M"))
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
