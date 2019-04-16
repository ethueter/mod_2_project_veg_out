class Cuisine < ApplicationRecord
  has_many :menu_items
  has_many :restaurants, through: :menu_items

end
