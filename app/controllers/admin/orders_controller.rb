class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @item = Item.pluck(:name)
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_root_path(order_sort: 0)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:detail_id)
  end

end
