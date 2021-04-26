class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:name])
    if @user
      session[:name] = @user.name
      session[:user_id] = @user.id
      redirect_to new_event_url
    else
      redirect_to sessions_create_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_new_path
  end

  private

  def login(user)
    session[:user_id] = nil
  end
end
