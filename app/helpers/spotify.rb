helpers do
  def current_user
    if session[:spotify]
      session[:spotify]['info'] = session[:spotify]['extra']['raw_info']
      @current_user ||= RSpotify::User.new(session[:spotify])
    end
  end
end
