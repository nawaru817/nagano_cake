class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @item_name = Item.pluck(:name)
    @items = Item.all
    @item_price = Item.pluck(:price)
  end

  def complete
  end

  def create
    @order = Order.new(complete_order_params)
    @order.save!
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

  def complete_order_params
    params.permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

end
