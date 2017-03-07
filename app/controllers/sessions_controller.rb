class SessionsController < ApplicationController
  def new
    @facebook = {client_id: ENV['FACEBOOK_KEY'],
                 redirect_uri: "http://localhost:3001/auth/facebook/callback"}
  end

  def create
    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid]) do |user|
      user.provider = request.env['omniauth.auth'][:provider]
      user.name = request.env['omniauth.auth'][:info][:name]
      user.oauth_token = request.env['omniauth.auth'][:credentials][:token]
      user.oauth_token_expires_at = Time.at(request.env['omniauth.auth'][:credentials][:expires_at])
    end
    session[:user_id] = user.id
    redirect_to "/"
  end
end
