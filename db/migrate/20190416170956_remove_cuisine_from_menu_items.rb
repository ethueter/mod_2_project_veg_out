class RemoveCuisineFromMenuItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :menu_items, :cuisine
  end
end
