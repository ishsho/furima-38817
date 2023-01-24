class OrderTransact
  include ActiveModel::Model
  attr_accessor , :postal_code, :area_id, :municipalities, :adress, :building, :phone, :order, :user, :item

  with_options presence: true do
    validates :municipalities 
    validates :adress
    validates :order
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :postal_code, presence: true, format: {with: /\A\d{3}[-]?\d{4}\z/}
  validates :phone, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/}

  with_options presence: true, foreign_key: true do
    validates :user
    validates :item
  end

  def save
    order = Order.create(user: user, price: price)
    Transacts.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, 
                     adress: adress, building: building, phone: phone, order: order)
  end

end