class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # This method checks if we have a user signed in
  def login_required
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?

  # This method gives us details about our user
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user
end
