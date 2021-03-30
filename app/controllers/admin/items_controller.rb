class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @genre = Genre.pluck(:name)
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.pluck(:name)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(params[:id])
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :is_active)
  end
end
