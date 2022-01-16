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

end

# @users = User.all
#         @categories = Category.all
#         @category = @categories.find(1)
#         @tasks = @category.tasks.all