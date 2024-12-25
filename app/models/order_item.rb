class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
