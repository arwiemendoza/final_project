class HelperController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def additional_information

    end

    def accept_job

    end

    def reject_job

    end
end