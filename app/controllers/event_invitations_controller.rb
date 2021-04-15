class EventInvitationsController < ApplicationController
  def new
    @event_invitation = EventInvitation.new
  end

  def index
    @event_invitation = EventInvitation.new
  end

  def attend
    @event = Event.find_by(params[:event_id])
    @event.attendees << @user
    @event.save
  end

  def show
    @user = User.where.not(id: :current_user.id)
    @users = User.all
  end

  def create
    @event_invitation = EventInvitation.new(event_registration_params)

    if @event_invitation.save
      redirect_to users_show_path
    end
  end

  def invitation
    @event = Event.find_by(id: params[:event_id])
    @user = User.find_by(id: session[:user_id])
    @event.attendees << @user
    @event.save
  end

  private

  def set_event_registration
    @attendee = Attendee.find(params[:id])
  end

  def event_registration_params
    params.require(:event_invitation).permit(:user_id, :event_id)
  end
end
