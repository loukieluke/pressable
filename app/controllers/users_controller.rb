class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
            if logged_in? && @user.save
               ActionMailer::Base.mail(:to => @user.username,
                :subject => 'Welcome to The Super Star Productions ')
                redirect_to root_path
            elsif @user.save
                session[:user_id] = @user.id
                redirect_to root_path
            else
                render 'new'                
            end
        
    end

    def edit
        if !logged_in?
            # redirect to login page
        else
            #do something else
        end
    end

    def show
        @user = User.where("role = ?","friend")
        #@user = User.find(params[current_user.id])
        render :json => @user
    end

   

    def email
        @user = User.new(user_params)

    end

    private
    def user_params
      #  params.require(:user).permit(:username, :password)
      params.fetch(:user,{}).permit(:username, :password, :role)
    end

end
