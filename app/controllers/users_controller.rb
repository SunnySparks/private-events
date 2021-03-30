class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @name = current_user.name
  end

  def show
    @user = User.find(session[:user_id])
    @user.name = current_user.name
    @users = User.all
    @event = Event.find_by(params[:id])
    @events = Event.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_index_path
      if params[:remember_name]
        cookies[:commenter_name] = @comment.name
      else
        cookies.delete(:commenter_name)
      end
    else
      flash.now[:error] = "Could not save user"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :id)
  end
end
