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
    @user = User.find_by(id: session[:user_id])
    @event = @user.events.build(event_params)
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
    params.require(:event).permit(:location, :user_id, :time)
  end
end
