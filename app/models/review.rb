class Review < ApplicationRecord
  belongs_to  :user
  belongs_to  :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :title, presence: true, length: {minimum: 5}
  validates :rating, presence: true
  validates :price_range, presence: true
  validates :favorite_dish, presence: true
end
