class AddRatingToUsers < ActiveRecord::Migration[6.1]
  def change
      add_column :users, :rating, :integer, array: true, default: []
  end
end
