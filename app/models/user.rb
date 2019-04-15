class User < ApplicationRecord
  has_many  :reviews
  has_many  :menu_items
  has_many  :restaurants, through: :reviews
end
