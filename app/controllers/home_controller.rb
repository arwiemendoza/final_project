class HomeController < ApplicationController
  before_action :is_user_admin
  before_action :is_user_helper
  before_action :is_user_client

  def index
    redirect_to new_user_session_path
  end

  private
  def is_user_admin
    if current_user.present? && current_user.admin
      redirect_to admin_index_path
    end
  end

  def is_user_helper
    if current_user.present? && current_user.helper == true && current_user.mobile_number == nil
      redirect_to helper_additional_info_path
    elsif current_user.present? && current_user.helper == true
      redirect_to helper_index_path
    end
  end

  def is_user_client
    if current_user.present? && current_user.helper == false && current_user.mobile_number == nil
      redirect_to client_additional_info_path
    elsif current_user.present? && current_user.helper == false
      redirect_to user_index_url
    end
  end
end