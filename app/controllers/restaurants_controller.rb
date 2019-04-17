class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @spotlight = @restaurants.sample
  end

  def by_cuisine

    @cuisine = Cuisine.find_by(name: params[:cuisine])
    @restaurants = Restaurant.select{|r| r.cuisines.map{|c| c.id}.include?(@cuisine.id) }
    #redirect_to by_cuisine_path
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
