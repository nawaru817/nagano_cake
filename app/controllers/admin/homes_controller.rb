class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:order_sort] > "0" then
      @orders = Order.where(customer_id: params[:order_sort]).page(params[10]).reverse_order
      @order_details = OrderDetail.all
    else
      @orders = Order.page(params[10]).reverse_order
      @order_details = OrderDetail.all
    end
  end
end
