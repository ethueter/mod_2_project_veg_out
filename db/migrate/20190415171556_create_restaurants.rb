class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.integer :owner_id
      t.string  :url
      t.boolean :onsite_parking
      t.text    :description
      t.boolean :accepts_reservation  

      t.timestamps
    end
  end
end
