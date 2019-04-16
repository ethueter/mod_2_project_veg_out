class Restaurant < ApplicationRecord
  #belongs_to  :owner_id, class_name: :User
  has_many  :reviews
  has_many  :menu_items
  has_many  :users, through: :reviews
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone, length: { is: 10}
  validates :description, length: {minimum: 100}

  def most_recent_review
  end

  def rating
    @ratings = Restaurant.select{|x| x.id == @restaurant.id}
  end

  def price_range
  end

  def most_popular_dish
  end

  def most_reviews
  end

  def cuisines
    Restaurant.all.map do |r|
      r.cuisine
    end.unique
  end
end
