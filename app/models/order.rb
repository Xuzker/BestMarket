class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :date, presence: true
  validates :address, presence: true
end
