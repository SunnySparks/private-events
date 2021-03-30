class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end
end
