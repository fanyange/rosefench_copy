class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has successfully created!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update success!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:error] = "Please first log in"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    flash[:error] = "This user is not you."
    redirect_to root_url unless current_user?(@user)
  end

  def store_location
    session[:location_before_login] = request.fullpath if request.get?
  end
end
