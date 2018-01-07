class UsersController < ApplicationController
  before_action :must_log_in, except: [:new, :create]
  before_action :already_logged_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
