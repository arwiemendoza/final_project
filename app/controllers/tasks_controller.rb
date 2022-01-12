class TasksController < ApplicationController
    before_action :user_only, only: [:index, :new, :create, :edit, :update, :destroy] 

    def index
        @category = Category.find(params[:category_id])
        @tasks = @category.tasks
        @task = Task.new
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @category = Category.find(params[:category_id])
        @task = category.tasks.new
    end
    
    def create
        @category = Category.find(params[:category_id])
        if @category.tasks.create!(task_params)
            redirect_to category_tasks_path(@category.id)
            flash[:alert] = "Task was successfully created."

        else
            flash[:notice]
            redirect_to category_tasks_path(@category.id)
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
    
        if @task.update(task_params)
            redirect_to category_tasks_path
        else
            render :edit
        end
    end
    
    def destroy
        Task.find(params[:id]).destroy
        redirect_to category_tasks_path
    end 
    
    private 
    def task_params
        params.require(:task).permit(:name, :details, :hourly_rate, :date, :category_id)
    end

    def user_only
        if current_user.admin || current_user.helper
            redirect_to "/"
        end
    end

end