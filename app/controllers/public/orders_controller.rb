class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @cart_items = CartItem.all
    if @order.select_address == '0' then
      redirect_to orders_path
      @customer = Customer.find(current_customer.id)
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address

    elsif [@order,params[:select_address]] == '1' then
      @order = Order.new(order_params)

    end
  end

  def complete
  end

  def create
    @order = Order.new(complete_order_params)
    @order.status = 0
    @order.save!

    @cart_items = CartItem.all
    @cart_items.each do |cart_item|
      if cart_item.customer_id == current_customer.id then
        @order_detail = OrderDetail.new(order_detail_params)
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.price
        @order_detail.amount = cart_item.amount
        @order_detail.making_status = 1
        @order_detail.save!
      end
    end

    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :select_address)
  end

  def complete_order_params
    params.permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def order_detail_params
    params.permit(:order_id, :item_id, :price, :amount)
  end



end
