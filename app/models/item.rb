class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :state
  belongs_to :load
  belongs_to :area
  belongs_to :shipping_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :content, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,only_integer: true}

end
