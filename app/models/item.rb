class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category

  validates :image, presence: true
  validates :content, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/ }



end
