class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to :action => 'show', :id => @event.id
    else
      render :new
    end
  end

  def rsvp
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end


  private
  def post_params
    params.require(:event).permit(:title)
  end

  def event_params
    params.require(:event).permit(:title, :user_id, :time)
  end
end
