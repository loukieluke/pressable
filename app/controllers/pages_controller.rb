class PagesController < ApplicationController
    def home

    end

    def new
        render 'email'
    end

    def email
        @user = User.new(user_params)
        if @user.save
            @user = user
            mail(:to => @user.username,
            :subject => 'Welcome to The Super Star Productions ')
        else
            render 'email'
        end
    end

    private
    def user_params
        params.fetch(:user,{}).permit(:username, :password)
    end

   
end