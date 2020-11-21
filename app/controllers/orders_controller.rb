class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_4f0a0e503750967a08dbc060" 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
