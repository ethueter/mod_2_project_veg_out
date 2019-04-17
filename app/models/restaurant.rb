class Restaurant < ApplicationRecord
  #belongs_to  :owner_id, class_name: :User
  has_many  :reviews
  has_many  :menu_items
  has_many  :users, through: :reviews

  has_many  :cuisines, through: :menu_items

  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :phone, length: { is: 10}
  # validates :description, length: {minimum: 100}

  def most_recent_review
  end

  def avgrating(restaurant)
    if restaurant.reviews.count != 0
      @five = restaurant.reviews.select{|review| review.rating == 5}.count*5
      @four = restaurant.reviews.select{|review| review.rating == 4}.count*4
      @three = restaurant.reviews.select{|review| review.rating == 3}.count*3
      @two = restaurant.reviews.select{|review| review.rating == 2}.count*2
      @one = restaurant.reviews.select{|review| review.rating == 1}.count
      @avgrating = (@five + @four + @three + @two + @one)/restaurant.reviews.count
      @avgrating
    else
      @avgrating = 0
    end 
  end



  def price_range
  end

  def most_popular_dish
  end

  def most_reviews
  end


end
