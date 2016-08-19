get '/party/new' do
  binding.pry
  @host = Host.find_by_spotify_id(current_user.id)
  @party = Party.create(host: @host)
  erb :party
end
