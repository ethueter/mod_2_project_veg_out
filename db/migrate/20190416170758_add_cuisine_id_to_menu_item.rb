class AddCuisineIdToMenuItem < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :cuisine_id, :integer
  end
end
