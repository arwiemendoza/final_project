class ChangeDataTypeForTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :created_by, :string
  end
end
