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

    def get_rate_helper
        @task = Task.find(params[:id])
        @helper = User.find(params[:helper_id])
    end
    
    def patch_rate_helper
        @task = Task.find(params[:id])
        @helper = User.find(params[:helper_id])

        @array = @helper.rating.to_a
        input = params[:input_rating].to_i
        @array.push(input)
        @helper.update(rating: @array)
        @helper.save!

        @task.update(rated_by_client: true)
        @task.save!
        redirect_to user_index_path(@task.client_id)
    end

end