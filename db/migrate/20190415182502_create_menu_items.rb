class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.string :name
      t.integer :price
      t.string :description
      t.string :cuisine

      t.timestamps
    end
  end
end
