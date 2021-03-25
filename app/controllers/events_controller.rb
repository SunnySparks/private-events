class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = current_user.events
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
    @user = User.find_by(params[:id])
    @event = current_user.events.create(event_params)
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
    params.require(:event).permit(:location, :date)
  end
end
