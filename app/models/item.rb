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
    
    validates :product_name
    validates :product_detail
    validates :category_id, numericality: { other_than: 1 } 
    validates :product_condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_to_ship_id
    validates :price
    validates :image
  end
end
