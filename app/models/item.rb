class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details,dependent: :destroy
  has_many :orders, :through => :order_detail
  belongs_to :genre
  attachment :image
end
