class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[8]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
