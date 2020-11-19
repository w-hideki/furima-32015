class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days_to_ship



  with_options presence: true do
     validates :product_name, :product_detail, :image

    with_options numericality: { other_than: 1 } do
      validates :category_id, :product_condition_id, :delivery_fee_id, :area_id, :days_to_ship_id 
    end
      
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 }
    end
  end
end
