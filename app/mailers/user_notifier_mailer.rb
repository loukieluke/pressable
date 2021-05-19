class UserNotifierMailer < ApplicationMailer

    default :from => 'user@address.com'

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

    # send a signup email to the user, pass in the user object that contains the user's email address

    def send_signup_email(user)
        @user = user
        mail(:to => @user.username,
        :subject => 'Welcome to The Super Star Productions ')
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
