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
        # @category = Category.find(params[:category_id])
        # t = params[:task]
        # @category.tasks.create!(
        #     name: t[:name], 
        #     details: t[:details], 
        #     date: t[:date], 
        #     hourly_rate: t[:hourly_rate], 
        #     category_id: @category.id
        # )
        # redirect_to @category

        @category = Category.find(params[:category_id])
        @category.tasks.create!(task_params)
        redirect_to category_tasks_path(@category.id)
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
        params.require(:task).permit(:name, :details, :hourly_rate, :date, :category_id)
    end

    def user_only
        if current_user.admin || current_user.helper
            redirect_to "/"
        end
    end

end