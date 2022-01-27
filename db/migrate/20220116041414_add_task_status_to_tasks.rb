class AddTaskStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :task_status, :string
  end
end
