class Product < ApplicationRecord
    belongs_to :category
    validates :title, :price, :description, :post_at, presence: true
    validates_numericality_of :price, greater_than: 0
end