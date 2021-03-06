class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_root_path
  end

  def order_detail_params
    params.require(:order_detail).permit(:detail_id, :making_status)
  end
end
