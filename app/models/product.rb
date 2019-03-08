class Product < ApplicationRecord
    max_paginates_per 10
    belongs_to :category
    validates :title, :price, :description, :post_at, presence: true
    validates_numericality_of :price, greater_than: 0
 
    scope :category, -> (category) { where category: category}
end