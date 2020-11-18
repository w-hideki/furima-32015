class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]
  # def index
  #   @items = Item.includes(:user)
  # end

  # def new
  #   @item = Item.new
  # end

  # def create
  #   @item = Item.new(item_params)
  #   if @item.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  #   redirect_to root_path
  # end

  # private

  # def item_params
  # end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
