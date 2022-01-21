class UserController < ApplicationController
    before_action :is_admin
    before_action :is_helper, except: [:show, :get_rate_client, :patch_rate_client]

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

    def get_rate_client
        @task = Task.find(params[:id])
        @client = User.find(params[:client_id])
    end
    
    def patch_rate_client
        @task = Task.find(params[:id])
        @client = User.find(params[:client_id])

        @array = @client.rating.to_a
        input = params[:input_rating].to_i
        @array.push(input)
        @client.update(rating: @array)
        @client.save!

        @task.update(rated_by_helper: true)
        @task.save!
        redirect_to user_index_path(@task.helper_id)
    end

    def client_additional_info
        @user = current_user
    end

    def client_patch_additional_info
        @user = current_user
        # no_input = params[:mobile_number].to_i
        # loc_input = params[:location]
        @user.update(mobile_number: params[:mobile_number])
        @user.update(location: params[:location])
        @user.save!
        redirect_to user_index_path
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