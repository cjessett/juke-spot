helpers do
  def user_token
    session[:user_token]
  end

  def client_id
    ENV['CLIENT_ID']
  end

  def client_secret
    ENV['CLIENT_SECRET']
  end

  def auth_request
    string = "https://accounts.spotify.com/authorize?client_id=15a01e908ae742e1a45a223d26a7cc24&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fcallback&response_type=code&scope=user-read-private%20user-read-email&state=34fFs29kd09"
  end

  def redirect_uri
    "http://localhost:9393/callback"
  end

  def request_token(code)
    url = "https://accounts.spotify.com/api/token"
    grant_type = "authorization_code"

    HTTParty.post(url,
      :body => { :grant_type => grant_type,
                 :code => code,
                 :redirect_uri => redirect_uri,
                 :client_id => client_id,
                 :client_secret => client_secret
                 } )
  end
end
