class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update!(customer_params)
    redirect_to customers_mypage_path
  end

  def unsubscribe
  end

  def withdraw
    withdraw = Customer.find(current_customer.id)
    withdraw.is_deleted = false
    withdraw.update!(withdraw_params)
    redirect_to destroy_customer_session_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end

  def withdraw_params
    params.permit(:is_deleted)
  end


end
