class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  private

  def must_log_in
    redirect_to new_session_url unless logged_in?
  end

  def already_logged_in
    redirect_to bands_url if logged_in?
  end
end
