class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_detail, :category_id, :product_condition_id, :delivery_fee_id, :area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
