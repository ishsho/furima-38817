class OrderTransact
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :adress, :building, 
                :phone, :order, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipalities 
    validates :adress
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :postal_code, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :phone, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Transact.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, 
                     adress: adress, building: building, phone: phone, order_id: order.id)
  end
end