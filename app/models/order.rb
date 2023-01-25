class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :transact

  belongs_to :area
end
