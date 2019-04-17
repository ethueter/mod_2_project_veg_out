class MenuItemsController < ApplicationController

  def new
    @menu_item = MenuItem.new
  end

  def create
    byebug
    @menu_item = MenuItem.new(menu_items_params)
    if @menu_item.save
      redirect_to menu_path(@restaurant)
    else
      render :new
    end
  end

  def show
  end

  private

  def menu_items_params

    params.require(:menu_item).permit(:restaurant_id, :user_id, :name, :price, :description, :cuisine_id)
  end
end
