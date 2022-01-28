class TasksController < ApplicationController
    before_action :user_only, only: [ :new, :edit, :update] 

    def index
        @category = Category.find(params[:category_id])
        @tasks = @category.tasks
        @task = Task.new
        @users = User.all
    end
    
    def show
        @task = Task.find(params[:id])
        @user = User.find(params[:id])
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

    def accept_task
        task = Task.find(params[:id])
        @array = task.helper_applicants.to_a
        if @array.include?(current_user.id) == true
            flash[:notice] = "You already applied for this task."
            redirect_to category_path
        else
            @array.push(current_user.id)
            task.update(helper_applicants: @array)
            task.save
            flash[:notice] = "Thank you for applying."
            redirect_to helper_index_path
        end
    end

    def accept_helper
        @user_id = User.find(params[:user_id]).id
        task = Task.find(params[:task_id])
        task.update(task_status: "Approved")
        task.update(helper_id: @user_id)
        task.save!
        flash[:notice] = "Task status updated."
        redirect_to user_index_path
    end

    def show_task_info
        @task = Task.find(params[:task_id])
        @client = User.find(params[:client_id])
        @category = Category.all
    end

    def complete_task
        task = Task.find(params[:task_id])
        task.update(task_status: "Completed")
        task.save!
        flash[:notice] = "Task status updated."
        redirect_to user_index_path
    end

    def finish_task
        task = Task.find(params[:task_id])
        rate = task.hourly_rate
        client = User.find(task.client_id)
        helper = User.find(task.helper_id)


        task.update(task_status: "Finished")
        client.update(balance: client.balance - rate)
        helper.update(balance: helper.balance + rate)

        task.save!
        client.save!
        helper.save!
        
        flash[:notice] = "Task status updated."
        redirect_to user_index_path
    end
    
    private 
    def task_params
        params.require(:task).permit(:name, :details, :hourly_rate, :date, :category_id, :created_by, :client_id, :helper_id, :helper_applicants, :rated_by_helper, :rated_by_client, :longitude, :latitude)
    end

    def user_only
        if current_user.admin || current_user.helper
            redirect_to "/"
        end
    end

end