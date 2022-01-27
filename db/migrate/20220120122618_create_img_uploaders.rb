class CreateImgUploaders < ActiveRecord::Migration[6.1]
  def change
    create_table :img_uploaders do |t|

      t.timestamps
    end
  end
end
