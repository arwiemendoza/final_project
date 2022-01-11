class HelperController < ApplicationController

    def index
        @users = User.all
        @categories = Category.all
    end

    def show
        @user = User.find(params[:id])
    end

end