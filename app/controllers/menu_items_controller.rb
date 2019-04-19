class MenuItemsController < ApplicationController

  def new
    @menu_item = MenuItem.new
    @meal = meals
    @tag = tag
    @current_user=current_user
  end

  def create
    @current_user=current_user
    @menu_item = MenuItem.new(menu_items_params)
    if @menu_item.save
      redirect_to menu_path(@menu_item.restaurant_id)
    else
      render :new
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @current_user=current_user
    @restaurant=MenuItem.find(params[:id]).restaurant
  end

  def edit
    @current_user=current_user
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @current_user=current_user
    @restaurant = Restaurant.find(@menu_item.restaurant_id)
    if  (@current_user.id == @menu_item.user_id) || (@current_user.id == @restaurant.owner_id)
        if  @menu_item.update(menu_items_params)
            redirect_to menu_path(@menu_item.restaurant_id)
        else
flash[:failure]="There was an error while submitting your changes. Please try again."
            render :edit
        end
    else
flash[:failure]="You do not have permission to edit this item."
        redirect_to menu_path(@menu_item.restaurant.id)
    end
  end

  def destroy
    @current_user=current_user
    @menu_item = MenuItem.find(params[:id])
    @restaurant = Restaurant.find(@menu_item.restaurant_id)
    if  (@current_user.id == @menu_item.user_id) || (@current_user.id == @restaurant.owner_id)
        @menu_item.destroy
flash[:success]="Menu item deleted."
        redirect_to menu_path(@restaurant)
    else
flash[:failure]="You do not have permission to delete this restaurant."
        redirect_to menu_path(@restaurant)
    end
  end

  private

  def menu_items_params
    params.require(:menu_item).permit(:restaurant_id, :user_id, :name, :price, :description, :cuisine_id, :meal, :tag)
  end
end
