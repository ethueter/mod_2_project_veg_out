class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @spotlight = @restaurants.sample
    @top_rated = @restaurants.select{|x| x.avgrating(x) == 5}.sample(3)
    @most_recent_review = Review.all.order("created_at").last
  end

  def by_cuisine
    @cuisine = Cuisine.find_by(name: params[:cuisine])
    @restaurants = Restaurant.select{|r| r.cuisines.map{|c| c.id}.include?(@cuisine.id) }
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @avgrating = @restaurant.avgrating(@restaurant)
  end

  def edit
  end

  def update
  end


  def menu
    @restaurant = Restaurant.find(params[:id])
    @menu_items = MenuItem.select{|item| item.restaurant_id == @restaurant.id}
  end

  def add_menu_items
    @restaurant = Restaurant.find(params[:id])
    @menu_item = MenuItem.new
    @user_id = current_user.id
  end




  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :owner_id, :url, :onsite_parking, :accepts_reservation, :description)
  end


end
