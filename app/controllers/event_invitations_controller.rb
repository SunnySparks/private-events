class EventInvitationsController < ApplicationController
    before_action :require_login

    def new
        @event_invitation = EventInvitation.new
      end
    
    def attend
      @event = Event.find_by(params[:event_id])
      @event.attendees << current_user
      @event.save
    end

    def create
      @event_invitation = current_user.events.build(event_registration_params)
        if @event_invitation.save
          flash[:notice] = 'Event registration created'
          redirect_to events_path
        else
          flash.now[:warning] = 'There were problems when trying to create a new event registration'
          render :action => :new
        end

        @user = User.create!(
            id: params['user']['id'],
            name: params['user']['name']
            )
        
        if @user
            session[:user_id] = user.id
            render json: { status: :created, user: @user}
        else
            render json: { status: 500 }
        end
    end

    private

    def set_event_registration
      @attendee = Attendee.find(params[:id])
    end
   
    def event_registration_params
     params.require(:registration).permit(:user_id, :event_id)
    end
  end