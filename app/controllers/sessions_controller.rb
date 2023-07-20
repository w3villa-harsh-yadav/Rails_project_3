class SessionsController < ApplicationController
    before_action :already_logged_in_redirect ,only:[:new,:create]
    def new

    end

    def create
        @user = User.find_by user_name: params["sessions"]["user_name"]
       if @user && @user.authenticate(params["sessions"]["password"])
            flash[:notice] = 'Logged In Succesfully'
            session[:user_id]=@user.id
            redirect_to root_path
        else
            flash[:alert] = 'Invalid Credentials Please Try Again'
            render 'new'
       end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice]='Logged Out Sucessfully'
        redirect_to login_path
    end

    private

    def already_logged_in_redirect
        if logged_in?
            flash[:alert] = "You Are Already Logged in"
            redirect_to root_path
        end
    end
end
