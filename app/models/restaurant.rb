class Restaurant < ApplicationRecord
  belongs_to  :owner_id, class_name: :User 
  has_many  :reviews
  has_many  :menu_items
  has_many  :users, through: :reviews

end
