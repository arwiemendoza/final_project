class AdminController < ApplicationController

    def index
        @users = User.all
        @categories = Category.new
    end

    def approve_status
        user = User.find(params[:id])
        user.update(user_status: "Approved")
        user.save
        flash[:notice] = "User status updated."
        redirect_to admin_index_path
    end

    def reject_status
        user = User.find(params[:id])
        user.update(user_status: "Rejected")
        user.save
        flash[:notice] = "User status updated."
        redirect_to admin_index_path
    end

    def show
        @user = User.find(params[:id])
    end

    def user_list
        @user = User.all
    end
    

    def search
        respond_to do |format|
            begin
                if params[:id, :first_name, :last_name]
                    @user_search = User.all(params[:id, :first_name, :last_name])

                    if @admin_search
                        format.html{redirect_to admin_path(@user)}       
                    end
                end
            end
        end
      
    end

    private    
    
    def category_params
        params.require(:category).permit(:name, :description)
    end


end
