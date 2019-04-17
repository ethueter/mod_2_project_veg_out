class AddMealToMenuItem < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :meal, :string
  end
end
