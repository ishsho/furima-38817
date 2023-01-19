class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions do
   belongs_to :category
   belongs_to :state
   belongs_to :load
   belongs_to :area
   belongs_to :shipping_date
  end

  validates :image, presence: true
  validates :content, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :load_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :shipping_date_id, numericality: { other_than: 1 } 

  validates :price, presence: true



end
