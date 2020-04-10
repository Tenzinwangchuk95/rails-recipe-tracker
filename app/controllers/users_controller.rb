class UsersController < ApplicationController

    # skip_before_action :verified_user, only: [:new, :create]

    def show
        @user = User.find_by(id: params[:id])
    end


    def new 
        @user = User.new
    end 
    
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to new_session_path
        else 
            render :new   
        end
    end

    def destroy
        session.clear
        redirect_to new_session_path
    end
    

    private

    def user_params
        params.permit(:user_name, :password)
    end



end
