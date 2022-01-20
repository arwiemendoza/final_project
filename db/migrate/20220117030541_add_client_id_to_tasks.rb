class AddClientIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :client_id, :integer
  end
end
