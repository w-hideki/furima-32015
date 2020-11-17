class Item < ApplicationRecord
  belongs_to :user  
  has_one :order 

  validates :product_name, presence: true
  validates :product_detail, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
end
