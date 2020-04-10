class SessionsController < ApplicationController
    # skip_before_action :verified_user, only: [:new, :create]
  
    def new
      @session = User.new
    end
  
    def create
        if params[:user_name]
            if @user = User.find_by(user_name: params[:user_name])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to new_session_path
            end
        else
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
            end
         
            session[:user_id] = @user.id
         
            redirect_to user_path(@user)
        end
    end
  
    def destroy
      session.delete("user_id")
      redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end