class UserController < ApplicationController
    before_action :is_admin
    before_action :is_helper

    def index 
        @users = User.all
        @categories = Category.all
    @tasks = Task.all
    end

    def show
        @user = User.find(params[:id])
        @balance = current_user.balance
    end

    def destroy
    end

    private
    def is_admin
        if authenticate_user! && current_user.admin
            redirect_to root_path
        end
    end

    def is_helper
        if authenticate_user! && current_user.helper
            redirect_to root_path
        end
    end

    def money
end