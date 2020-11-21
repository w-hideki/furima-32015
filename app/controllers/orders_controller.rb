class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @shipping_address = OrderAddress.new
  end

  def create
    @shipping_address = OrderAddress.new(shipping_params)
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shipping_params
    params.require(:shipping_address).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
  end
end
