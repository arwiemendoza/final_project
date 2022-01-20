class AddHelperIdToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :helper_id, :integer
  end
end
