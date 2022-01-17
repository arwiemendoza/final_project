class AddHelpersApplicantToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :helper_applicants, :integer, array: true, default: []
  end
end
