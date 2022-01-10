class CategoryController < ApplicationController
    before_action :is_user_admin
    before_action :is_user_helper, only: %i[show]
    
    def index
        @categories = Category.all
    end
    
    def show
        @category = Category.find(params[:id])
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.create!(category_params)
    
        if @category.save 
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
        end
    end

    def is_user_helper
        if authenticate_user! && current_user.helper
            return true
        end
    end
end
