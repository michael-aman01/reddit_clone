class SessionsController < ApplicationController

    # before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create

        @user = User.find_by_credentials( params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to users_url
        else
            @user = User.new(username: params[:user][:username],password: params[:user][:password])
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end
