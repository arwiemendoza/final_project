class AddMobileLocationAttachmentsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mobile_number, :string
    add_column :users, :location, :text
  end
end
