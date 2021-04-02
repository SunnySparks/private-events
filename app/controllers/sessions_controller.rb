class SessionsController < ApplicationController
    skip_before_action :login_required, :only => [:new, :create]

    def new
      @user = User.new
    end
  
    def create
      user = User.find_by(params[:user_id])
        if user && user.authenticate(params[:user_id])
          session[:user_id] = user.id
        else
          render “new”
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  
    private
    def login(user)
        session[:user_id] = nil
    end
end
