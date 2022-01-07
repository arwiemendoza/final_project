class HomeController < ApplicationController
  before_action :is_user_admin
  before_action :is_user_helper

  def index
    redirect_to user_index_url
  end

  private
  def is_user_admin
    if current_user.present? && current_user.admin
      redirect_to admin_index_path
    end
  end

  def is_user_helper
    if current_user.present? && current_user.helper
      redirect_to helper_index_path
    end
  end
end