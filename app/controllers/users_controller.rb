class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
         @user = User.new(params.require(:user).permit(:user_name,:password))
         if @user.save
            flash[:notice] ="User Signed Up Succesfully"
            session[:user_id]=@user.id
            redirect_to root_path
         else
            render 'new'
         end

     end
end
