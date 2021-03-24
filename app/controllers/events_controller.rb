class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
    @user = current_user
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end

  def create
    @user = User.find_by(id: session[:user_id])
    #@user = User.find_by(creator_id: @user.id).destroy
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to :action => 'show', :id => @event.id
    else
      render :new
    end
  end




  private
  def post_params
    params.require(:event).permit(:location)
  end

  def event_params
    params.require(:event).permit(:location, :time)
  end
end
