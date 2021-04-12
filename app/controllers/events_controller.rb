class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = current_user.events
    @user = User.find_by(id: session[:user_id])
    @attendees = @user.attended_events.all
    @attendeename = @user.name
  end

  def attend
    @user = User.find_by(id: session[:user_id])
    @event = Event.find_by(params[:event_id])
    @event.attendees << @user
    @event.save
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def show
    @event = Event.find_by(params[:event_id])
    @events = Event.all
    @user = User.find_by(name: params[:user_name])
    @attendees = @event.attendees
  end

  
  def create
    @user = User.find_by(id: session[:user_id])
    @event = @user.events.build(event_params)
    @attendees = @events.attendees.build(attendee_params)
    if @event.save
      redirect_to action: 'show', id: @event.id
    else
      render :new
    end
    
    if @attendees.save
      redirect_to users_show_url
    else
      flash.now[:notice] = "Invitation not sent"
    end
  end

  def invitation
    @event = Event.find_by(params[:event_id])
    @events = Event.all
    @attendees = @event.attendees
    @user = User.find_by(id: params[:user_id])   
    @users = User.all
  end

  def update
    @event = Event.find_by(params[:event_id])
    @events = Event.all
    @user = User.find_by(id: params[:user_id])   
    @users = User.all
  end

  private

  def post_params
    params.require(:event).permit(:location)
  end

  def event_params
    params.require(:event).permit(:location, :date)
  end

  def attendee_params
    params.require(:event).permit(:attendes)
  end

end
