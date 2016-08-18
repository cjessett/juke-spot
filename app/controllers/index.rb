get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/auth' do
  redirect auth_request
end

get '/callback' do
  p params.inspect
  erb :index
end
