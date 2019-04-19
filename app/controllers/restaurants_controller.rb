class RestaurantsController < ApplicationController



  def index
    @restaurants = Restaurant.all
    @spotlight = @restaurants.sample
    @top_rated = @restaurants.select{|x| x.avgrating(x) >= 3}.sample(3)
    @most_recent_review = Review.all.order("created_at").last
    @top_veggie = @restaurants.select{|x| x.veggie_rating(x) >= 75}.sample(3)
  end

  def by_cuisine
    @cuisine = Cuisine.find_by(name: params[:cuisine])
    @restaurants = Restaurant.select{|r| r.cuisines.map{|c| c.id}.include?(@cuisine.id) }
  end

  def new
    @restaurant = Restaurant.new
    @current_user = current_user
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if  @restaurant.save
        redirect_to restaurant_path(@restaurant)
    else
flash[:failure]="There was an error while creating your restaurant. Please try again."
        render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @avgrating = @restaurant.avgrating(@restaurant)
  end

  def edit
    @current_user=current_user
    @restaurant=Restaurant.find(params[:id])
  end

  def update
    @current_user=current_user
    @restaurant=Restaurant.find(params[:id])
    if  @current_user.id == @restaurant.owner_id
        if  @restaurant.update(restaurant_params)
flash[:success]="You have successfully updated this restaurant."
            redirect_to restaurant_path(@restaurant)
        else
flash[:failure]="Unable to save edits to current restaurant. Please check that all required fields have valid entries."
            redirect_to edit_restaurant_path(@restaurant)
        end
    else
flash[:failure]="You do not have permission to edit this restaurant."
        redirect_to restaurant_path(@restaurant)
    end
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

  def destroy
    @current_user=current_user
    @restaurant=Restaurant.find(params[:id])
    if  @current_user.id == @restaurant.owner_id
        @restaurant.destroy
        redirect_to restaurants_path
    else
flash[:failure]="You do not have permission to delete this restaurant."
        redirect_to restaurant_path(@restaurant)
    end
  end

  def search_by_name
    @search=(params[:search_name])
    @results=Restaurant.search_name(params[:search_name])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :owner_id, :url, :onsite_parking, :accepts_reservation, :description)
  end

end
