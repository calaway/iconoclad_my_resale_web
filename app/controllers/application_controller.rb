class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user&.admin?
  end

  private

  before_action :authenticate!

  def authenticate!
    is_login_path = params[:controller] == 'sessions' &&
                    params[:action].in?(%w[new create failure])
    return if current_user || is_login_path
    redirect_to login_path
  end
end
