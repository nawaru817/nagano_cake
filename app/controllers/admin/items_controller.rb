class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    @items.save
    redirect_to admin_items_path
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
end
