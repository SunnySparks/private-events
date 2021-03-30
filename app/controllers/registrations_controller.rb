class RegistrationssController < ApplicationController
    before_action :require_login
  
    def create
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
    
  end