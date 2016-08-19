helpers do
  def current_user
    session[:spotify]['info'] = session[:spotify]['extra']['raw_info'] unless session[:spotify].nil?
    @current_user ||= RSpotify::User.new(session[:spotify]) unless session[:spotify].nil?
  end
end
