get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/auth' do
   redirect auth_request
end

get '/callback' do
  response = request_token(params[:code])
  binding.pry
  session[:user_token] = response["access_token"]
  erb :index
end
