class AddAmountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :amount, :float
  end
end
