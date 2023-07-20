class ApplicationController < ActionController::Base
    helper_method :logged_in?,:current_user
   def current_user
        @current_user = User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert]= "You Have To Login To Perform this Action"
            redirect_to login_path
        end
    end
end
