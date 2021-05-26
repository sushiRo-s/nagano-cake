class Product < ApplicationRecord
  
  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre
  attachment :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :title, presence: true
  validates :price, presence: true
  
end
