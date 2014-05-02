class SessionsController < ApplicationController
  # include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Logged in"
      redirect_to user
    else
      flash.now[:error] = "Invalid email / password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
