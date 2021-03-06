module SessionsHelper
  def log_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:encrypt_remember_token, User.encrypt(remember_token))
    self.current_user = user 
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = cookies[:remember_token]
    @current_user ||= User.find_by(encrypt_remember_token: User.encrypt(remember_token))
  end

  def log_out
    current_user.update_attribute(:encrypt_remember_token, nil)
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(user)
    current_user == user
  end
end
