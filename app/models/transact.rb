class Transact < ApplicationRecord
  belongs_to :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
