class UserController < ApplicationController
    before_action :is_admin, except: [:show]
    before_action :is_helper, except: [:show]

    def index 

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