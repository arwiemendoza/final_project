class AddCreatedByToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :created_by, :integer
  end
end
