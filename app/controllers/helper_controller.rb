class HelperController < ApplicationController

    def index
        @users = User.all
        @categories = Category.all
        @category = @categories.find(1)
        @tasks = Task.all
    end

    def show
        @user = User.find(params[:id])
        @categories = Category.all
        @task = Task.all
    end

    def show_applicant
        @user = User.find(params[:user_id])
        @task = Task.all
        @task_id = Task.find(params[:id])
    end
end