class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_oauth(oauth_info)
    session[:user_id] = user.id
    redirect_to "/", notice: "Login Successful"
  end

  def failure
    redirect_to login_path, notice: "Login Unsuccessful"
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logout Successful"
  end

private
  def oauth_info
    request.env['omniauth.auth']
  end
end
