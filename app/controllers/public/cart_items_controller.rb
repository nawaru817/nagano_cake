class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @item_name = Item.pluck(:name)
    @item_image = Item.pluck(:image_id)
    @items = Item.all
    @item_price = Item.pluck(:price)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
