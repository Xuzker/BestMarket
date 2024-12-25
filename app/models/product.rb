class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_url, presence: true, format: { with: URI::regexp(%w[http https]), message: "должен быть корректным URL" }
end
