class HelperController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def approve_status
        user = User.find(params[:id])
        user.update(:user_status => "Approved")
        user.save
        flash[:notice] = "User status updated."
        redirect_to admin_index_path
    end

    def reject_status
        user = User.find(params[:id])
        user.update(:user_status => "Rejected")
        user.save
        flash[:notice] = "User status updated."
        redirect_to admin_index_path
    end
end
