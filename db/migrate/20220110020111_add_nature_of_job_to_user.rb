class AddNatureOfJobToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nature_of_job, :text, array: true, default: []
  end
end
