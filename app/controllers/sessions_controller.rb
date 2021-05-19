class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:session][:username])

        #authenticate user credentials
        if !!@user && @user.authenticate(params[:session][:password])
            #set session and redirect on success
            session[:user_id] = @user.id
            flash[:notice] = "Logged in successfully."
            redirect_to root_path
        else
        #error message on fail
        #message = "Something went wrong, make sure your username and password are correct"
        flash.now[:alert] = "Something went wrong, make sure your username and password are correct"
        #redirect_to login_path, notice: message
        render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out"
        redirect_to root_path
    end

end
