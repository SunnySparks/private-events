class SessionsController < ApplicationController

    def index
    end

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(params[:name])
        if @user && @user.authenticate(params[:name])
          session[:name] = @user.name
        else
          redirect_to sessions_create
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to sessions_create
    end
  
    private
    def login(user)
        session[:user_id] = nil
    end
end
