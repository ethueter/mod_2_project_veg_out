class AddTagsToMenuItem < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :tag, :string
  end
end
