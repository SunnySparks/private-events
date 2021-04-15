class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @event = Event.find_by(params[:id])
    @events = Event.all
  end

  def show
    @user = User.where.not(:id=>current_user.id)
    @users = @user.all
    @event = Event.find_by(params[:id])
    @events = Event.all
    @event_invitation = EventInvitation.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to events_new_path
      if params[:remember_name]
        cookies[:user_name] = @user.name
      else
        cookies.delete(:user_name)
      end
    else
      redirect_to users_new_path
      flash.now[:notice] = "User not registered"
    end
  end

  def authenticate
    env["warden"].authenticate!
  end

  def invite
    @event = Event.find_by(id: params[:event_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :id)
  end

  def name
    params.require(:user).permit(:name)
  end
end
