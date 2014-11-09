class UsersController < ApplicationController

	skip_before_filter :authorize

	def index

    end

    def new
        @user = User.new
    end
    def create
        @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
        if @user.save
        	session[:user_id] = @user.id.to_s
            redirect_to post_path
        else
            render "new"
        end
    end

end
