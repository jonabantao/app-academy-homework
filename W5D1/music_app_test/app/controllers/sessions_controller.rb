class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:email], params[:password])

    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    @current_user.try(:reset_session_token!)
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
