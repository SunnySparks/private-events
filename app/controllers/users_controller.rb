class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @name = current_user.name
  end

  def show
    @user = User.find(session[:user_id])
    @user.name = current_user.name
    @events = User.created_events.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        #redirect_to :action => 'show', :id => session[:user_id]
        redirect_to users_index_path
        if params[:remember_name]
          # Remember the commenter's name.
          cookies[:commenter_name] = @comment.name
        else
          # Delete cookie for the commenter's name cookie, if any.
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
