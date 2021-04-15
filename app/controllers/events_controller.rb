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
    if @event.save
      redirect_to action: 'show', id: @event.id
    else
      render :new
    end

  end

  def invitation
    @event = Event.find_by(params[:event_id])
    @events = Event.all
    @attendees = @event.attendees
#    @user = User.find_by(name: params[:user_name])
#    @user = User.find_or_create_by(name: params[:user_name])
    @user = User.find_by(params[:name]) 
    @event_invitation = EventInvitation.new(user_id: @user.id, event_id: @event.id)
    @event_invitation.save
  end

  def update
    @event = Event.find_by(params[:event_id])
    @events = Event.all
    @user = User.find_by(id: params[:user_id])   
    @users = User.all
  end

  private

  def event_params
    params.require(:event).permit(:location, :date)
  end

  def attendee_params
    params.require(:event).permit(:attendes)
  end

end
