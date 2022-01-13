class CategoryController < ApplicationController
    before_action :is_user_admin
    before_action :admin_only, only: [:new,:create,:edit,:update,:destroy] 
    before_action :is_user_helper
    
    def index
        @categories = User.find(1).categories
        @ccategories = Category.new
    end
    
    def show
        @category = Category.find(params[:id])
        @tasks = @category.tasks.all
    end
    
    def new
        user = current_user.categories.create!(category_params)
    end
    
    def create
        if is_user_admin
            category = current_user.categories.create!(category_params)
            redirect_to category_index_path
        else
            render :new
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params)
            redirect_to category_index_path
        else
            render :edit
        end
    end
    
    def destroy
        Category.find(params[:id]).destroy
        redirect_to category_index_path
    end 
    
    private 
    
    def category_params
        params.require(:category).permit(:name, :description)
    end

    def is_user_admin
        authenticate_user! && current_user.admin
    end

    def is_user_helper
        authenticate_user! && current_user.helper 
    end

    def admin_only
        if current_user.admin == false
            redirect_to "/"
        end
    end

end
