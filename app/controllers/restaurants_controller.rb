class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private



end
