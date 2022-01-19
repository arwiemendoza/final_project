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
        rate_user
    end

    def destroy
    end

    def deposit
        user = current_user
        user.balance += params[:amount].to_i
        @balance = current_user.balance
        user.save
        @amount = params[:amount].to_i
    end

    def withdraw
        user = current_user
        user.balance -= params[:amount].to_i
        @balance = current_user.balance
        user.save
    end

    def rate_user
        @users
        user_rate = user.rating.push(params[:input_rating])
        @user.update


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

end