class HelperController < ApplicationController
  def index
    @users = User.all
    @categories = Category.all
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

  def show_task_info
    @task = Task.find(params[:task_id])
    @client = User.find(params[:client_id])
    @category = Category.all
  end

  def helper_additional_info
    @user = current_user
  end

  def helper_patch_additional_info
    @user = current_user
    @user.update(mobile_number: params[:mobile_number])
    @user.save!
    redirect_to user_index_path
  end
end
