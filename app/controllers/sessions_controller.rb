class SessionsController < ApplicationController
  def new
    @facebook = {client_id: ENV['FACEBOOK_KEY'], redirect_uri: "http://localhost:3001/auth/facebook/callback"}
  end
end
