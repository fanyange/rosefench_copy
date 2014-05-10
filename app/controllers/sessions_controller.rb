class SessionsController < ApplicationController
  # include SessionHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Logged in"
      # redirect_to user
      redirect_back_or_to(user)
    else
      flash.now[:error] = "Invalid email / password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private
  def redirect_back_or_to(default)
    # if session[:location_before_login]
    #   redirect_to session[:location_before_login]
    # else
    #   redirect_to default
    # end
    redirect_to(session[:location_before_login] || default)
    session.delete(:location_before_login)
  end
end
