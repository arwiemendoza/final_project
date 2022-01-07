class UserController < ApplicationController
    before_action :is_admin
    before_action :is_helper

    def index 

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