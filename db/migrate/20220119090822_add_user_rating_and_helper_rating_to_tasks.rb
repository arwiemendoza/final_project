class AddUserRatingAndHelperRatingToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :rated_by_client, :boolean, default: false
    add_column :tasks, :rated_by_helper, :boolean, default: false
  end
end
