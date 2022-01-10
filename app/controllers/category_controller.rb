class CategoryController < ApplicationController
    before_action :is_user_admin
    before_action :is_user_helper, only: %i[show]
    
    def index
        @categories = Category.all
    end
    
    def show
        current_user.categories.find(params[:user_id])
    end
    
    def new
        user = current_user.categories.create!(category_params)
    end
    
    def create
        user = current_user.categories.create!(category_params)
    
        if user 
            redirect_to categories_path
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
            redirect_to categories_path
        else
            render :edit
        end
    end
    
    def delete
        category.find(params[:id]).destroy
        redirect_to categories_path
    end 
    
    private 
    
    def category_params
        params.require(:category).permit(:name)
    end

    def is_user_admin
        if authenticate_user! && current_user.admin
            return true
        else
            return false
    end

    def is_user_helper
        if authenticate_user! && current_user.helper
            return true
        else
            return false
    end
end
