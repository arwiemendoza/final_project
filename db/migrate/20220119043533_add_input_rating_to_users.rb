class AddInputRatingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :input_rating, :integer
  end
end
