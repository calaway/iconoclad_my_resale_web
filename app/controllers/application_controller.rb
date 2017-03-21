class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  before_action :authorize!
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    is_login_path = params[:controller] == "sessions" &&
                    params[:action].in?(%w(new create failure))
    unless current_user || is_login_path
      puts "🔥 Not authorized to access #{params[:controller]}##{params[:action]} - Redirecting🔥"
      redirect_to login_path
    end
  end
end
