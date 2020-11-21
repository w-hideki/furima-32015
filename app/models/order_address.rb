class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :phone_number
    validates :token
    validates :phone_number, format: { with: /\A0\d{10}\z/ }
    validates :area_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, phone_number: phone_number, address: address, building_name: building_name, order_id: order_id)
  end
end