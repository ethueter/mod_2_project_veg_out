class MenuItemsController < ApplicationController

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_items_params)
    if @menu_item.save
      redirect_to menu_path(@menu_item.restaurant_id)
    else
      render :new
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(menu_items_params)
      redirect_to menu_path(@menu_item.restaurant_id)
    else
      render :edit
    end
  end 


  def destroy
    @item = MenuItem.find(params[:id])
    @restaurant = Restaurant.find(@item.restaurant_id)
    @item.destroy
    redirect_to menu_path(@restaurant)
  end

  private

  def menu_items_params

    params.require(:menu_item).permit(:restaurant_id, :user_id, :name, :price, :description, :cuisine_id)
  end
end
