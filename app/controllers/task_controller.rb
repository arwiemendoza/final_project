class TaskController < ApplicationController
    before_action :user_only, only: [:new,:create,:edit,:update,:destroy] 

    def index
        @categories = User.find(1).categories
        @tasks = Task.new
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        task = User.find(1).categories.find(1)
        task.Task.new!(task_params)
    end
    
    def create
        task = User.find(1).categories.find(1)
        task.Task.new!(task_params)
         
        if @task.save
            redirect_to task
        else
            render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
    
        if @task.update(task_params)
            redirect_to task
        else
            render :edit
        end
    end
    
    def destroy
        Task.find(params[:id]).destroy
        redirect_to task
    end 
    
    private 
    
    def task_params
        params.require(:category).permit(:name, :details, :hourly_rate, :date)
    end

    def user_only
        if current_user.admin == false && current_user.helper == false
            redirect_to "/"
        end
    end

end